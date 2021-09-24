
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>
<style>
.ag-header-cell-label {
	justify-content: center;
}
.grid-wrapper::after {
	display: block;
	content: '';
	clear: both;
}
.btn {
	margin: 2px;
}
.float_left {
	float: left;
}
.float_right {
	float: right;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>첨부파일 관리</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">


<link rel="stylesheet" href="/css/food/common.css" type="text/css">

<link rel="stylesheet" href="/css/food/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/css/food/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/css/food/nice-select.css" type="text/css">
<link rel="stylesheet" href="/css/food/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/css/food/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/css/food/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/css/food/style.css" type="text/css">
</head>

<body>
	<!-- Header Section Begin -->
	<jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp" />
	<!-- Header Section End -->

	<section class="stock">
		<div class="container">
			<!-- 테이블 넣을 곳 -->
			<div id="commonSearchDiv_container"></div>
			<!-- <div style="padding: 2px;">
				<div style="float: left">
					<button type="button" class="btn btn-secondary"
						onclick="onBtSelectAll()">전체선택</button>
					<button type="button" class="btn btn-secondary"
						onclick="onBtDeselectAll()">선택취소</button>
				</div>
				<div style="float: left">&nbsp; &nbsp;</div>
				<div style="float: left">&nbsp; &nbsp;</div>
				<div style="float: right">
					<button type="button" class="btn btn-primary" onclick="onBtSearch()">조회</button>
					<button type="button" class="btn btn-success" onclick="onBtAddBottom()">신규</button>
					<button type="button" class="btn btn-warning" onclick="onBtSave()">저장</button>
					<button type="button" class="btn btn-danger" onclick="onBtDelete()">삭제</button>
				</div>

			</div> -->
			<div id="updateRows"
				style="height: 100px; border: 1px solid #f4f4f4; margin: 5px 0"></div>
			<div class="grid-wrapper">
				<div style="width: 70%; height: 580px; float: left" id="myGrid"
					class="ag-grid-div ag-theme-balham ag-basic"></div>
				<div style="width: 20%; height: 580px; float: right" id="selectedRowImg"></div>
			</div>

		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.nice-select.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/jquery.slicknav.js"></script>
	<script src="/js/mixitup.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/main.js"></script>

	<!-- AS GRID -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://unpkg.com/ag-grid/dist/ag-grid.min.js"></script>
	<script src="/js/react/agGridUtil.js?ver=01"></script>
	
	<script src="/js/react/commonFunctions.js?ver=324"></script>
	
	<script>
		
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
				editable : false
			}, 
			{
				headerName : "첨부파일등록",
				field : "fileUploadButton",
				cellEditor: 'btnCellRenderer', 
			    width : 100,
			    editable : function(params) {
					return (params.data.rowType == "new")?true:false;
				}
			},
			{
				field : "rowType",
				width : 0,
				hide : true,
				editable : true
			}];
			
			var fn_customColumnSetting = function(gridOpt) {
				gridOpt.components = {
					btnCellRenderer: getBtnCellRenderer("파일등록")   
				};
				
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
			mainGrid = new NewGrid("myGrid", columnDefs, 'multiple', false, fn_customColumnSetting);
			
			
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
			
			// 이벤트 등록
			const btnSelectAll = document.querySelector('.btn-select-all');
			const btnDeselectAll = document.querySelector('.btn-deselect-all');
			btnSelectAll.addEventListener('click', function(event){
				onBtSelectAll();
		    });
			btnDeselectAll.addEventListener('click', function(event){
				onBtDeselectAll();
		    });
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
			gfn_loadData('/cmm/main/management/getAtchFileListByAtchFileId.do')
			.then(function (datums) {
				fn_serachRows(datums);
			})
			.catch(function (err) {
				console.error(err.statusText);
			});
		}
		
		/*	신규	*/
		function onBtAddBottom() {
			
			// 신규행이 있을 경우 행추가 불가능하게
			var hasNewRow = false;
			mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
				if (rowNode.data.rowType == "new") {
					hasNewRow = true;	
				}
			});
			if(hasNewRow) {
				return;
			}
			
			// 초기값 넣기
			var newRow = {
				atchFileId : null,
				fileCn : '',
				fileSn : '',
				fileStreCours : '',
				streFileNm : '',
				fileExtSn : '',
				orignlFileNm : '',
				fileSize : '',
				creatDt : '',
				fileUploadButton : '파일등록',
				rowType : "new"
			}
			
			// 
			mainGrid.gridOpts.api.updateRowData({
				add : [ newRow ]
			});
		}
		// 삭제
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
		
		var fn_uploadDataRequest = function(updateRows) {
			// 그리드 데이터 업로드 요청
			gfn_uploadData(updateRows, '/cmm/fms/fileListRemove.do')
			.then(function (datums) {
				console.log(datums);
				fn_loadDataRequest();
				updateRows = [];	// 업데이트 로우맵 초기화
				alert("저장이 완료되었습니다!");
			})
			.catch(function (err) {
				console.error(err.statusText);
			});
		}
		
		//업무버튼
		var fn_gridBtnOnClicked = function() {
			var url = '/cmm/fms/EgovFileUploadPopup.do';
			var winWidth = 700;
			var winHeight = 300;
			var popupOption = "width="+winWidth+",height="+winHeight;
			
			if(window.showModalDialog == undefined){  
				window.showModalDialog = function(url,mixedVar,features){  
			    	window.hasOpenWindow = true;  
	            	if(mixedVar) var mixedVar = mixedVar;  
	            	if(features) var features = features.replace(/(dialog)|(px)/ig,"").replace(/;/g,',').replace(/\:/g,"=");  
	                window.myNewWindow = window.open(url,"_blank",features);  
		        }
			}
			
			window.showModalDialog(url, "", popupOption);
			
		}
		
		// 팝업결과 리턴
		var fn_egovFileUploadPopupHandler = function(_this, result) {
			_this.window.close();
			alert("저장이 완료되었습니다!");
			fn_loadDataRequest();
		}
		
		// setup the grid after the page has finished loading
		document.addEventListener('DOMContentLoaded',
			function() {
				fn_makeGrid();
			
				fn_loadDataRequest();
			}
		);
	</script>
	
  	<!-- React를 실행. -->
  	<!-- 주의: 사이트를 배포할 때는 "development.js"를 "production.min.js"로 대체하세요. -->
  	<script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
  	<script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
	
	<!-- 만든 React 컴포넌트를 실행. -->
	<script src="/js/react/commonSearchDiv.js?ver=01"></script>
</body>

</html>