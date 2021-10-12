/**
 * 
 */
var stockList 			= [];	// 재고
var stockMap		   	= {};	// 재고

var updateRows 	= []; // 신규,수정
var removedRows = []; // 삭제

var mainGrid;	// 메인그리드
var columnDefs;	// 그리드 컬럼정보


var fn_makeGrid = function() {
	
	// 그리드1 컬럼 정보 세팅
	columnDefs = [ {
		checkboxSelection : true
	},
	{
		field : "productId",
		width : 0,
		hide : true,
		editable : false
	},
	{
		headerName : "재고명",
		field : "stockId",
		width : 150,
		cellEditor: 'agSelectCellEditor',
        cellEditorParams: {
           values: extractValues(stockMap)
        },
        filter: 'agSetColumnFilter',
        refData: stockMap,
        hide:true,
		editable : true
	},
	{
		headerName : "재고량",
		field : "stockAmt",
		width : 120,
		valueGetter: function(params) {
			var stockId = params.getValue('stockId');
			var stockAmt = '';
			for(var stock of stockList) {
				if(stock.stockId == stockId) {
					stockAmt = stock.stockAmt;
					break;
				}
			}
			return stockAmt;
		},
		hide:true,
		editable : false
	},
	{
		headerName : "제품명",
		field : "productName",
		width : 200,
		cellRenderer: function(params) {
	      return '<a class="gridColumn" href="/cmm/main/management/productRegist.do?productId='+params.data.productId+'">'+ params.value+'</a>'
	  	},
		editable : false
	}, 
	{
		headerName : "제품요약",
		field : "productSummary",
		width : 150,
		editable : true,
	},
	{
		headerName : "제품원가",
		field : "productPrice",
		width : 150,
		editable : true,
		type: "numericColumn"
	},
	{
		headerName : "제품할인가",
		field : "productDiscountPrice",
		width : 150,
		editable : true,
		type: "numericColumn"
	},
	{
		headerName : "원산지",
		field : "productOrigin",
		width : 150,
		editable : true
	},
	{
		headerName : "배송비",
		field : "productDeliverypay",
		width : 120,
		editable : true
	},
	{
		headerName : "제품판매여부",
		field : "productStatus",
		width : 200,
		editable : true
	},
	{
		headerName : "조회수",
		field : "productRdcnt",
		width : 100,
		editable : false
	},
	{
		headerName : "추천수",
		field : "productBestcnt",
		width : 100,
		editable : false
	}, 
	{
		headerName : "등록자",
		field : "productRegid",
		width : 100,
		hide : true,
		editable : false
	},
	{
		headerName : "수정자",
		field : "productUpdid",
		width : 100,
		hide : true,
		editable : false
	},
	{
		headerName : "등록일",
		field : "productRegdate",
		width : 100,
		hide : true,
		editable : false
	},
	{
		headerName : "수정일",
		field : "productUpddate",
		width : 100,
		hide : true,
		editable : false
	},
	{
		field : "rowType",
		width : 80,
		hide : true,
		editable : true
	}];
	
	mainGrid = new NewGrid("myGrid", columnDefs, "multiple", true);

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
var fn_serachRows = function(rowData) {
	var eGridDiv = document.querySelector('#myGrid');
	if(eGridDiv.hasChildNodes()) {
		fn_gridRefresh(rowData);	
	} else {
		mainGrid.makeGrid(rowData);
	}
}
/*	리프레쉬	*/
var fn_gridRefresh = function(rowData) {
	mainGrid.gridOpts.api.refreshCells();
	mainGrid.gridOpts.api.setRowData(rowData);
	
	// 삭제된 행 초기화
	removedRows = [];
}

// 그리드1 데이터 로드 요청
var fn_loadDataRequest = function() {
	gfn_loadData('/cmm/main/management/getProductList.do')
	.then(function (datums) {
		fn_serachRows(datums);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}


/*	신규	*/
function onBtAddBottom() {
	
	// 제품등록 페이지로 이동
	location.href="/cmm/main/management/productRegist.do";
	
	/* 
	// 초기값 넣기
	var newRow = {
		productId : null,
		stockId : null,
		productName : '',
		productSummary : '',
		productPrice : 0,
		productDiscountPrice : 0,
		productOrigin : '',
		productDeliverypay : 0,
		productStatus : '',
		productRdcnt : 0,
		productBestcnt : 0,
		productRegid : '',
		productUpdid : '',
		productRegdate : '',
		rowType : "new"
	}
	
	// 
	mainGrid.gridOpts.api.updateRowData({
		add : [ newRow ]
	}); */
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

/*	저장	*/

function onBtSave() {
	// 필수체크
	var savable = true;
	var edit_count = 0;
	mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
		if(rowNode.data.stockId == ''
		|| rowNode.data.productName == ''
		|| rowNode.data.productPrice == ''
		|| rowNode.data.productOrigin == '') {
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
	
	// $("#updateRows").html(JSON.stringify(uploadRows));
	fn_uploadDataRequest(uploadRows);
}

// fn_requestDataToUpload
var fn_uploadDataRequest = function(uploadRows) {
	// 그리드 데이터 업로드 요청
	gfn_uploadData(updateRows, '/cmm/main/management/registProduct.do')
	.then(function (datums) {
		console.log(datums);
		fn_loadDataRequest();	// 재조회
		updateRows = [];		// 업데이트 로우맵 초기화
		if(datums=="success") {
			alert("저장이 완료되었습니다!");
		} else if(datums=="fail") {
			alert("저장이 실패하였습니다.");
		}
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

var fn_setStockMap = function() {
	for(var stock of stockList) {
		stockMap[stock.stockId] = stock.stockName;
	}
	
	fn_makeGrid();
}

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		gfn_commonLoadDataRequest('/cmm/main/management/getStockList.do', stockList, fn_setStockMap);
		
		fn_loadDataRequest();
	}
);