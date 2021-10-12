/**
 * 
 */
var updateRows 	= []; // 신규,수정
var removedRows = []; // 삭제

var mainGrid;	// 메인그리드
var columnDefs;	// 그리드 컬럼정보

var fn_makeGrid = function() {
	columnDefs = [ {
		checkboxSelection : true
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
		width : 100,
		editable : true
	}, 
	{
		headerName : "재고량",
		field : "stockAmt",
		width : 100,
		editable : true,
		type: "numericColumn"
	},
	{
		field : "rowType",
		width : 100,
		hide : true,
		editable : true
	}];
	
	// gridDiv, columnDefs, rowSelection, isScroll
	mainGrid = new NewGrid("myGrid", columnDefs, "multiple", false)
	
	function onBtStopEditing() {
		mainGrid.gridOpts.api.stopEditing();
	}
	function onBtNextCell() {
		mainGrid.gridOpts.api.tabToNextCell();
	}
	function onBtPreviousCell() {
		mainGrid.gridOpts.api.tabToPreviousCell();
	}
	/*	전체선택	*/
	function onBtSelectAll() {
		mainGrid.gridOpts.api.selectAll();
	}
	/*	전체선택해제	*/
	function onBtDeselectAll() {
		mainGrid.gridOpts.api.deselectAll();
	}
}

/*	조회	*/
function onBtSearch() {
	// 조회조건이 있다면 여기서 체크
	fn_loadDataRequest();
}
function fn_serachRows(rowData) {
	var eGridDiv = document.querySelector('#myGrid');
	if(eGridDiv.hasChildNodes()) {
		fn_gridRefresh(rowData);	
	} else {
		mainGrid.makeGrid(rowData);
	}
}
/*	리프레쉬	*/
function fn_gridRefresh(rowData) {
	mainGrid.gridOpts.api.refreshCells();
	mainGrid.gridOpts.api.setRowData(rowData);
	
	// 삭제된 행 초기화
	removedRows = [];
}

// 그리드1 데이터 로드 요청
function fn_loadDataRequest() {
	gfn_loadData('/cmm/main/management/getStockList.do')
	.then(function (datums) {
		fn_serachRows(datums);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

/*	신규	*/
function onBtAddBottom() {
	// 초기값 넣기
	var newRow = {
		stockId : null,
		stockName : '',
		stockAmt : '',
		rowType : "new"
	}
	
	// 
	mainGrid.gridOpts.api.updateRowData({
		add : [ newRow ]
	});
}

function onBtDelete() {
	fn_deleteRows();
}

var fn_deleteRows = function() {
	var selectedRows = mainGrid.gridOpts.api.getSelectedRows();
	selectedRows.forEach(function(selectedRow, index) {
		if(selectedRow.rowType != "new") {
			selectedRow.rowType = "removed";
			removedRows.push(selectedRow);	
		}
		mainGrid.gridOpts.api.updateRowData({
			remove : [ selectedRow ]
		});
	});
}

function onBtSave() {
	fn_saveCheck();
}

var fn_saveCheck = function() {
	// 필수체크
	var savable = true;
	var edit_count = 0;
	mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
		if(rowNode.data.stockName == ''
		|| rowNode.data.stockAmt == '') {
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
	mainGrid.gridOpts.api.stopEditing();
	mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
		if (rowNode.data.edit) {
			updateRows.push(rowNode.data);
		}
	});
	var uploadRows = Object.assign(updateRows, removedRows);
	
	fn_uploadDataRequest(uploadRows);
}

var fn_uploadDataRequest = function(uploadRows) {
	// 그리드2 데이터 업로드 요청
	gfn_uploadData(updateRows, '/cmm/main/management/registStock.do')
	.then(function (datums) {
		console.log(datums);
		alert("저장이 완료되었습니다!");
		updateRows = [];	// 업데이트 로우맵 초기화
		fn_loadDataRequest();
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}
// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		fn_makeGrid();
	
		fn_loadDataRequest();
	}
);