/**
 * 
 */
var updateRows 	= []; // 신규,수정
var removedRows = []; // 삭제

var mainGrid;	// 메인그리드
var columnDefs;	// 그리드 컬럼정보	

var findRowIndex = 0;

// 이미지 불러오기 용
const selectedRowImg = document.querySelector("#selectedRowImg");
const imgExtArr = ['gif','jpg','bmp','png'];	// 이미지 확장자 체크

var fn_makeGrid = function() {
	// 그리드1 컬럼 정보
	columnDefs = [ {
		checkboxSelection : true
	},
	{
		headerName : "첨부파일 아이디",
		field : "atchFileId",
		width : 150,
		hide : true,
		editable : false
	}, 
	{
		headerName : "파일내용",
		field : "fileCn",
		width : 200,
		hide : true,
		editable : true
	},
	{
		headerName : "파일확장자",
		field : "fileExtsn",
		width : 100,
		hide : true,
		editable : false
	}, 
	{
		headerName : "파일연번",
		field : "fileSn",
		width : 100,
		hide : true,
		editable : true
	}, 
	{
		headerName : "파일저장경로",
		field : "fileStreCours",
		width : 200,
		hide : true,
		editable : false
	}, 
	{
		headerName : "원파일명",
		field : "orignlFileNm",
		width : 100,
		hide : false,
		editable : false
	}, 
	{
		headerName : "저장파일명",
		field : "streFileNm",
		width : 100,
		hide : true,
		editable : false
	},
	{
		headerName : "파일크기",
		field : "fileMg",
		width : 100,
		hide : false,
		editable : false
	},
	{
		headerName : "생성일자",
		field : "creatDt",
		width : 200,
		hide : true,
		editable : false
	},
	{
		field : "rowType",
		width : 0,
		hide : true,
		editable : true
	}];
	
	var fn_customColumnSetting = function(gridOpt) {
		
		gridOpt.onRowSelected = function(event) {
			if(event.node.selected == true) {
				findRowIndex = mainGrid.gridOpts.api.getSelectedNodes(0)[0].rowIndex;
			}
			// 그리드 컬럼 수정 여부 동적 제어
			if(event.node.selected == true 
				&& event.node.data.rowType == "new") {
				mainGrid.columnDefs[6].editable = true;
				mainGrid.columnDefs[10].editable = true;
				
				while(selectedRowImg.hasChildNodes()) {
					selectedRowImg.removeChild(selectedRowImg.firstChild);
				}
			} else if(event.node.selected == true
					&& event.node.data.rowType != "new") {
				mainGrid.columnDefs[6].editable = false;
				mainGrid.columnDefs[10].editable = false;
				
				while(selectedRowImg.hasChildNodes()) {
					selectedRowImg.removeChild(selectedRowImg.firstChild);
				}
				
				var selectedRow = mainGrid.gridOpts.api.getSelectedNodes(0)[0].data;
				
				if(imgExtArr.indexOf(selectedRow.fileExtsn.toLowerCase()) >= 0) {
					var imgSrc = selectedRow.fileStreCours + selectedRow.streFileNm;
					var imgTag= document.createElement("img");
					
					imgTag.src = imgSrc;
					
					selectedRowImg.append(imgTag);	
				}
			}
		}
		
		gridOpt.onCellKeyDown = function(event) {
			console.log('cellKeyDown');
		}
		
		gridOpt.onCellKeyPress = function(event) {
			console.log('cellKeyPress');
		}
	}
	
	// gridDiv, columnDefs, rowSelection, isScroll, fn_customColumnSetting
	mainGrid = new NewGrid("myGrid", columnDefs, 'single', false, fn_customColumnSetting);
	
	
	function onBtStopEditing() {
		mainGrid.gridOpts.api.stopEditing();
	}
	function onBtNextCell() {
		mainGrid.gridOpts.api.tabToNextCell();
	}
	function onBtPreviousCell() {
		mainGrid.gridOpts.api.tabToPreviousCell();
	}
}

/*	조회	*/
function onBtSearch() {
	// 조회조건이 있다면 여기서 체크
	fn_loadDataRequest();
}
// 그리드 1 조회
var fn_serachRows = function(rowData) {
	var eGridDiv = document.querySelector('#myGrid');
	
	if(eGridDiv.hasChildNodes()) {
		fn_gridRefresh(rowData);
		
		mainGrid.gridOpts.api.selectIndex(findRowIndex);
		
	} else {
		mainGrid.makeGrid(rowData);
		
		mainGrid.gridOpts.api.selectIndex(findRowIndex);
	}
}

/*	리프레쉬	*/
var fn_gridRefresh = function(rowData) {
	mainGrid.gridOpts.api.refreshCells();
	mainGrid.gridOpts.api.setRowData(rowData);
	
	removedRows = [];
}

// 그리드1 데이터 로드 요청
var fn_loadDataRequest = function() {
	gfn_loadData('/cmm/fms/getImgFileList.do')
	.then(function (datums) {
		fn_serachRows(datums);
	})
	.catch(function (err) {
		console.error(err.statusText);
	});
}

// 선택완료 클릭시

var onBtSelect = function() {
	if(mainGrid.gridOpts.api.getSelectedNodes(0).length>0) {
		fn_closePopup(mainGrid.gridOpts.api.getSelectedNodes(0)[0].data);	
	} else {
		alert("이미지를 선택하십시오.");	
	}
}

var fn_closePopup = function(result) {
	try {
        window.opener.fn_imgFilePopupHandler(this, result);
    } catch (err) {}
}

// setup the grid after the page has finished loading
document.addEventListener('DOMContentLoaded',
	function() {
		fn_makeGrid();
	
		fn_loadDataRequest();
	}
);