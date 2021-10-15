/**
 * 
 */
var updateRows 	= []; // 신규,수정
var removedRows = []; // 삭제

var productTypeList	= [];	// 타입
var productTypeMap	= {};	// 타입

var mainGrid;	// 메인그리드
var columnDefs;	// 그리드 컬럼정보	

var fn_makeGrid = function() {
	columnDefs = [ {
		checkboxSelection : true
	},
	/* {field: "No.", width: 40, minWidth: 40, maxWidth: 40, editable: false}, */
	{
		field : "categoryId",
		width : 0,
		hide : true,
		editable : false
	},
	{
		headerName : "타입명",
		field : "typeId",
		width : 100,
		cellEditor: 'select',
        cellEditorParams: {
           values: extractValues(productTypeMap)
        },
        filter: 'agSetColumnFilter',
        refData: productTypeMap,
		editable : true
	},
	{
		headerName : "이름",
		field : "categoryName",
		width : 100,
		editable : true
	}, 
	{
		headerName : "순서",
		field : "categoryOrder",
		width : 100,
		editable : true,
		type: "numericColumn"
	}, 
	{
		headerName : "사용여부",
		field : "categoryStatus",
		width : 100,
		editable : true
	}, 
	{
		field : "rowType",
		width : 120,
		hide : true,
		editable : true
	}];
	
	// gridDiv, columnDefs, rowSelection, isScroll
	mainGrid = new NewGrid("myGrid", columnDefs, "multiple", false);
	
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

// 데이터 가져오기
// 그리드1 데이터 로드 요청
var fn_loadDataRequest = function() {
	gfn_loadData('/cmm/main/management/getProductCategoryList.do')
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
	var maxCategoryOrder = 0;
	mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
		maxCategoryOrder = (+rowNode.data.categoryOrder > +maxCategoryOrder)?rowNode.data.categoryOrder:maxCategoryOrder;
	});
	maxCategoryOrder = +maxCategoryOrder + 1;
	var newRow = {
		categoryId 		: null,
		typeId 			: null,
		categoryName 	: '',
		categoryOrder 	: maxCategoryOrder,
		categoryStatus 	: 'Y',
		rowType 		: "new"
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

/*	저장	*/
function onBtSave() {
	fn_saveCheck();
}

var fn_saveCheck = function() {
	// 필수체크
	var savable = true;
	var edit_count = 0;
	mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
		if(rowNode.data.categoryName == ''
		|| rowNode.data.typeId == ''
		|| rowNode.data.categoryOrder == ''
		|| (rowNode.data.categoryStatus != 'Y' && rowNode.data.categoryStatus != 'N')) {
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
	
	/*$("#updateRows").html('');
	$("#updateRows").html(JSON.stringify(uploadRows));*/
	fn_uploadDataRequest(uploadRows);
}
//

var fn_uploadDataRequest = function(uploadRows) {
	// 그리드 데이터 업로드 요청
	gfn_uploadData(updateRows, '/cmm/main/management/registProductCategory.do')
	.then(function (datums) {
		console.log(datums);
		alert("저장이 완료되었습니다!");
		updateRows = [];	// 업데이트 로우맵 초기화
		fn_loadDataRequest();	// 재조회
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

var fn_setProductTypeMap = function() {
	for(var productType of productTypeList) {
		productTypeMap[productType.typeId] = productType.typeName;
	}
	
	// 그리드 호출
	fn_makeGrid();
}

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		gfn_commonLoadDataRequest('/cmm/main/management/getProductTypeList.do', productTypeList, fn_setProductTypeMap);
		
		fn_loadDataRequest();
	}
);