/**
 * 
 */
var findRowIndex = 0;
		
var updateRows 	= []; // 신규,수정
var removedRows = []; // 삭제

var mainGrid;	// 그리드1
var mainGrid2;	// 그리드2

var columnDefs1; // 그리드1 컬럼정보
var columnDefs2; // 그리드2 컬럼정보

columnDefs1 = [ 
{
	field : "stockId",
	width : 0,
	hide : true,
	editable : false
}, 
{
	headerName : "재고명",
	field : "stockName",
	width : 100,
	editable : false
}, 
{
	headerName : "재고량",
	field : "stockAmt",
	width : 100,
	editable : false,
	type: "numericColumn"
},
{
	field : "rowType",
	width : 100,
	hide : true,
	editable : true
}];

// 그리드2 컬럼 정보
columnDefs2 = [ {
	checkboxSelection : true
},
{
	field : "stockIoId",
	width : 0,
	hide : true,
	editable : false
}, 
{
	field : "stockId",
	width : 0,
	hide : true,
	editable : false
}, 
{
	headerName : "재고명",
	field : "stockName",
	width : 150,
	valueGetter: function(params) {
		var stockId = params.getValue('stockId');
		var stockName = '';
		mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
			if (rowNode.data.stockId == stockId) {
				stockName = rowNode.data.stockName;
			}
		});
		return stockName;
	},
	hide : false,
	editable: false
},
{
	headerName : "입출고량",
	field : "stockIoAmt",
	width : 120,
	editable : true,
	type: "numericColumn"
},
{
	headerName : "입출고",
	field : "stockIoType",
	width : 100,
	editable : true
},
{
	headerName : "입출고날짜",
	field : "stockIoDate",
	width : 200,
	cellEditor : 'dateTimePicker',
	valueFormatter : row => moment(row.data.stockIoDate).format('YY.MM.DD a hh:mm'),
	editable : true
},
{
	field : "rowType",
	width : 100,
	hide : true,
	editable : true
}];
		
var MainGrid = function(gridDiv, columnDefs, rowSelection) {
	var _this = this;
	/* grid 영역 정의 */
	this.gridDiv = gridDiv;
	this.columnDefs = columnDefs;
	this.rowSelection = rowSelection;
	
	/* grid 칼럼 정의 */
	this.getColumnDefs = function() {
		
		var gridOpt = CommonGrid.getDefaultGridOpt(_this.columnDefs);
		
		gridOpt.components = {
			dateTimePicker: getDateTimePicker()   
		};
		
		gridOpt.rowSelection = _this.rowSelection;

		gridOpt.onRowEditingStarted = function(event) {
			console.log('never called - not doing row editing');
		};
		gridOpt.onRowEditingStopped = function(event) {
			console.log('never called - not doing row editing');
		};
		gridOpt.onCellEditingStarted = function(event) {
			console.log('cellEditingStarted');
		};
		gridOpt.onCellEditingStopped = function(event) {
			console.log('cellEditingStopped');
			if(event.data.rowType != "new") event.data.rowType = "updated";
			event.data.edit = true;
			gridOpt.api.updateRowData({
				update : [ event.data ]
			});
			console.log(gridOpt.api
					.getDisplayedRowAtIndex(event.rowIndex).data);
		};
		
		// 그리드1 row 선택시 그리드2 조회 이벤트
		if(_this.gridDiv == "myGrid") {
			gridOpt.onRowSelected = function(event) {
				// 그리드2 헤더(재고명) 동적 제어
				if(event.node.selected == true 
					&& event.rowIndex == 0) {
					mainGrid2.columnDefs[3].hide = false;
					// 헤더까지 지우기
					$('#myGrid2').children().remove();
				} else if(event.node.selected == false
						&& event.rowIndex == 0) {
					mainGrid2.columnDefs[3].hide = true;
					// 헤더까지 지우기
					$('#myGrid2').children().remove();
				}
				
				// 그리드 2 조회
				if(event.node.selected == true) {
					fn_loadDataRequest2(event.data.stockId);
				}
			}
			
			gridOpt.onCellKeyDown = function(event) {
				console.log('cellKeyDown');
			}
			
			gridOpt.onCellKeyPress = function(event) {
				console.log('cellKeyPress');
			}
		}
		
		return gridOpt;
	};
	/* grid 옵션 가져오기 */
	this.gridOpts = null;
	/* grid 실행 */
	this.makeGrid = function(rowData) {
		_this.gridOpts = _this.getColumnDefs();
		CommonGrid.makeGridCommon(_this.gridDiv, _this.gridOpts,
				rowData)
	};
	
	this.getRowIndex = function(node) {
		return node.rowIndex + 1;
	};
}

// 선택된 행의 stockId

var mainGrid = new MainGrid("myGrid", columnDefs1, 'single');
var mainGrid2 = new MainGrid("myGrid2", columnDefs2, 'multiple');

function onBtStopEditing() {
	mainGrid2.gridOpts.api.stopEditing();
}
function onBtNextCell() {
	mainGrid2.gridOpts.api.tabToNextCell();
}
function onBtPreviousCell() {
	mainGrid2.gridOpts.api.tabToPreviousCell();
}
/*	전체선택	*/
function onBtSelectAll() {
	mainGrid2.gridOpts.api.selectAll();
}
/*	전체선택해제	*/
function onBtDeselectAll() {
	mainGrid2.gridOpts.api.deselectAll();
}
/*	조회	*/
function onBtSearch() {
	// 조회조건이 있다면 여기서 체크
	// fn_loadDataRequest();
	
	// 그리드1의 첫번째행 선택
	mainGrid.gridOpts.api.selectIndex(0);
}
// 그리드 1 조회
var fn_serachRows = function(rowData) {
	var eGridDiv = document.querySelector('#myGrid');
	
	var firstRow = {
		stockId : null,
		stockName : '(전체)',
		stockAmt : '',
		rowType : ''
	};
	
	if(eGridDiv.hasChildNodes()) {
		fn_gridRefresh(rowData);
		mainGrid.gridOpts.api.updateRowData({add: [firstRow], addIndex:0});
		
		// 그리드1 선택했던 행 계속 선택하도록 row_index 저장하는 것 필요함
		mainGrid.gridOpts.api.selectIndex(findRowIndex);
	} else {
		mainGrid.makeGrid(rowData);
		
		// 최초 로딩시 그리드1의 첫번째행 선택
		mainGrid.gridOpts.api.updateRowData({add: [firstRow], addIndex:0});
		mainGrid.gridOpts.api.selectIndex(0);
	}
}
// 그리드 2 조회
var fn_serachRows2 = function(rowData) {
	var eGridDiv = document.querySelector('#myGrid2');
	if(eGridDiv.hasChildNodes()) {
		fn_gridRefresh2(rowData);	
	} else {
		mainGrid2.makeGrid(rowData);
	}
}

/*	리프레쉬	*/
var fn_gridRefresh =function(rowData) {
	mainGrid.gridOpts.api.refreshCells();
	mainGrid.gridOpts.api.setRowData(rowData);
}

var fn_gridRefresh2 = function(rowData) {
	mainGrid2.gridOpts.api.refreshCells();
	mainGrid2.gridOpts.api.setRowData(rowData);
	
	// 삭제된 행 초기화
	removedRows = [];
}

// 
// 그리드1 데이터 로드 요청
var fn_loadDataRequest = function() {
	gfn_loadData('/cmm/main/management/getStockList.do')
	.then(function (datums) {
		fn_serachRows(datums);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

// 그리드2 데이터 로드
var fn_loadData2 =function(stockId) {
	return new Promise((resolve, reject) => {
	const xhr = new XMLHttpRequest();
	xhr.responseType = 'json';

	xhr.open('POST',
			'/cmm/main/management/getStockIoListByStockId.do?stockId='+stockId,
			true);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	
	xhr.onload = function() {
		if (this.status >= 200 && this.status < 300) {
			resolve(xhr.response);
		} else {
			reject({
				status: this.status,
				statusText: xhr.statusText
			});
		}
	};
	xhr.onerror = function () {
      reject({
        status: this.status,
        statusText: xhr.statusText
      });
    };
    xhr.send();
  });
}
// 그리드2 로드 요청
var fn_loadDataRequest2 = function(stockId) {
	fn_loadData2(stockId)
	.then(function (datums) {
		fn_serachRows2(datums);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});	
}	

/*	신규	*/
function onBtAddBottom() {
	
	// (전체)일 때는 신규 못하게
	if(mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockId == null) {
		return;
	}
	
	// 초기값 넣기
	var newRow = {
		stockIoId : null,
		stockId : mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockId,
		stockIoAmt : '',
		stockIoType : '',
		stockIoDate : moment().format('YYYY-MM-DD HH:mm:ss'),
		rowType : "new"
	}
	
	// 
	mainGrid2.gridOpts.api.updateRowData({
		add : [ newRow ]
	});
}

function onBtDelete() {
	fn_deleteRows();
}

var fn_deleteRows = function() {
	var selectedRows = mainGrid2.gridOpts.api.getSelectedRows();
	selectedRows.forEach(function(selectedRow, index) {
		if(selectedRow.rowType != "new") {
			selectedRow.rowType = "removed";
			removedRows.push(selectedRow);	
		}
		mainGrid2.gridOpts.api.updateRowData({
			remove : [ selectedRow ]
		});
	});
}

// 저장버튼 클릭시
function onBtSave() {
	fn_saveCheck();
}
// 저장가능한지 체크
var fn_saveCheck = function() {
	// 필수체크
	var savable = true;
	var edit_count = 0;
	mainGrid2.gridOpts.api.forEachNode(function(rowNode, index) {
		if(rowNode.data.stockIoType == ''
		|| isNaN(rowNode.data.stockIoAmt)
		|| moment(rowNode.data.stockIoDatetime, "yyyy-mm-dd hh:MM:ss").isValid()) {
			savable = false;
		};
		if (rowNode.data.edit) {
			edit_count++;
		}
		edit_count += removedRows.length;
	});
	
	if(edit_count==0) {
		alert("수정된 값이 없습니다.");
		return;
	}
	
	if(savable) {
		if(confirm("저장하시겠습니까?")) {
			fn_saveRows();
		};
	} else {
		alert("저장할 값이 잘못 되었습니다. 확인 해주십시오.");	
	};
}

var fn_saveRows = function() {
	mainGrid2.gridOpts.api.stopEditing();
	mainGrid2.gridOpts.api.forEachNode(function(rowNode, index) {
		if (rowNode.data.edit) {
			updateRows.push(rowNode.data);
		}
	});
	var uploadRows = Object.assign(updateRows, removedRows);
	
	// $("#updateRows").html(JSON.stringify(uploadRows));
	fn_uploadDataRequest(uploadRows);
}

// 그리드2 데이터 내보내기
var fn_uploadDataRequest = function() {
	// 그리드2 데이터 업로드 요청
	gfn_uploadData(updateRows, '/cmm/main/management/registStockIo.do')
	.then(function (datums) {
		console.log(datums);
		fn_loadDataRequest2(mainGrid.gridOpts.api.getSelectedRows(0)[0].stockId);
		updateRows = [];	// 업데이트 로우맵 초기화
		alert("저장이 완료되었습니다!");
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

// 업무버튼
// 재고량 업데이트
// onBtUpdateStock 클릭시
function onBtUpdateStock () {
	fn_updateStockCheck();
}

// 필수체크
var fn_updateStockCheck = function() {
	// 선택된 행이 없으면 불가능
	if(mainGrid.gridOpts.api.getSelectedNodes(0)[0] == null) {
		return;
	}
	
	findRowIndex = mainGrid.gridOpts.api.getSelectedNodes(0)[0].rowIndex;
	
	// (전체)에서는 저장 불가능
	if(mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockId == null) {
		return;
	}
	
	var savable = true;
	var edit_count = 0;
	mainGrid2.gridOpts.api.forEachNode(function(rowNode, index) {
		if(rowNode.data.stockIoType == ''
		|| isNaN(rowNode.data.stockIoAmt)
		|| moment(rowNode.data.stockIoDatetime, "yyyy-mm-dd hh:MM:ss").isValid()) {
			savable = false;
		};
		if (rowNode.data.edit) {
			edit_count++;
		}
		edit_count += removedRows.length;
	});
	
	if(edit_count!=0) {
		alert("수정된 값이 있습니다. 저장 후 버튼을 클릭해주세요.");
		return;
	}
	
	if(savable) {
		if(confirm("재고량을 업데이트 하시겠습니까?")) {
			fn_updateStockRequest();
		};
	} else {
		alert("저장할 값이 잘못 되었습니다. 확인 해주십시오.");	
	};
}

var fn_updateStockRequest = function() {
	mainGrid2.gridOpts.api.stopEditing();
	var stockInputAmtSum = 0;	// 가용재고: 입고, 입고대기 재고량 합
	mainGrid2.gridOpts.api.forEachNode(function(rowNode, index) {
		if (rowNode.data.stockIoType == '입고'
		|| rowNode.data.stockIoType == '입고대기') {
			stockInputAmtSum = +stockInputAmtSum + +rowNode.data.stockIoAmt;
		} else {
			stockInputAmtSum = +stockInputAmtSum - +rowNode.data.stockIoAmt;
		}
	});
	
	// 서버에 넘길 데이터 세팅
	var updateStockRow = [{
		stockId : mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockId,
		stockName : mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockName,
		stockAmt : stockInputAmtSum,
		rowType : "updated"
	}]
	
	// 재고량 데이터 업로드 요청
	gfn_uploadData(updateStockRow, '/cmm/main/management/registStock.do')
	.then(function (datums) {
		console.log(datums);
		fn_loadDataRequest();
		alert("저장이 완료되었습니다!");
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		fn_loadDataRequest();
	}
);