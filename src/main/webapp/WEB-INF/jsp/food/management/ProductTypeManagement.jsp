
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE>

<html>
<style>
.ag-header-cell-label {
   justify-content: center;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 유형 관리</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    
    <link rel="stylesheet" href="/css/food/common.css" type="text/css">
    
    <link rel="stylesheet" href="/css/food/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/food/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/food/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/food/style.css" type="text/css"> 
</head>

<body>
    <!-- Header Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainHeader.jsp"/> 
    <!-- Header Section End -->
	
<section class="type">
	<div class="container">
	<!-- 테이블 넣을 곳 -->
	<div style="padding: 2px;">
		<div style="float:left">
        	<button type="button" class="btn btn-secondary" onclick="onBtSelectAll()">전체선택</button>
        	<button type="button" class="btn btn-secondary" onclick="onBtDeselectAll()">선택취소</button>
        </div>
        <div style="float:left">
	        &nbsp;
	        &nbsp;
        </div>
        <!-- <div style="float:left">
	        <input type="radio" class="radio" name="typeStatus" value="all">
	        <label for="typeStatusAll">전체</label>
	        <input type="radio" class="radio" name="typeStatus" value="y">
	        <label for="typeStatusY">Y</label>
	        <input type="radio" class="radio" name="typeStatus" value="n">
	        <label for="typeStatusN">N</label>
        </div> -->
        <div style="float:left">
	        &nbsp;
	        &nbsp;
        </div>
        <div style="float:right">
	        <button type="button" class="btn btn-primary" onclick="onBtSearch()">조회</button>
	        <button type="button" class="btn btn-success" onclick="onBtAddBottom()">신규</button>
	        <button type="button" class="btn btn-warning" onclick="onBtSave()">저장</button>
	        <button type="button" class="btn btn-danger" onclick="onBtDelete()">삭제</button>
        </div>

    </div>
    <div id="updateRows" style="height:100px;border:1px solid #f4f4f4;margin:5px 0"></div>
    <div class="grid-wrapper">
        <div style="width: 100%; height:580px" id="myGrid" class="ag-grid-div ag-theme-balham ag-basic"></div>
    </div>
	
	</div>
</section>
    <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/jsp/food/sub/FoodMainFooter.jsp"/> 
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.23.0/moment.min.js"></script>
	<script src="https://unpkg.com/ag-grid/dist/ag-grid.min.js"></script>
	<script src="/js/react/agGridUtil.js?ver=1"></script>
	<script src="/js/react/commonFunctions.js"></script>
	
	<script>
		var updateRows 	= []; // 신규,수정
		var removedRows = []; // 삭제
		
		var mainGrid;	// 메인그리드
		var columnDefs;	// 그리드 컬럼정보	
		
		var fn_makeGrid = function() {
			columnDefs = [ {
				checkboxSelection : true
			},
			/* {field: "No.", width: 40, minWidth: 40, maxWidth: 40, editable: false}, */
			{
				field : "typeId",
				width : 0,
				hide : true,
				editable : false
			},
			{
				headerName : "이름",
				field : "typeName",
				width : 100,
				editable : true
			},
			{
				headerName : "순서",
				field : "typeOrder",
				width : 100,
				editable : true,
				type: "numericColumn"
			},
			{
				headerName : "사용여부",
				field : "typeStatus",
				width : 100,
				editable : true
			},
			{
				field : "rowType",
				width : 80,
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
		var fn_loadDataRequest = function() {
			gfn_loadData('/cmm/main/management/getProductTypeList.do')
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
			var maxTypeOrder = 0;
			mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
				maxTypeOrder = (+rowNode.data.typeOrder > +maxTypeOrder)?rowNode.data.typeOrder:maxTypeOrder;
			});
			maxTypeOrder = +maxTypeOrder + 1;
			var newRow = {
				typeId : null,
				typeName : '',
				typeOrder : maxTypeOrder,
				typeStatus : 'Y',
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
				if(rowNode.data.typeName == ''
				|| rowNode.data.typeOrder == ''
				|| (rowNode.data.typeStatus != 'Y' && rowNode.data.typeStatus != 'N')) {
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
		
		// 데이터 내보내기 
		var fn_uploadDataRequest = function(uploadRows) {
			// 그리드 데이터 업로드 요청
			gfn_uploadData(updateRows, '/cmm/main/management/registProductType.do')
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
		
		// setup the grid after the page has finished loading
		document.addEventListener('DOMContentLoaded',
			function() {
			
				fn_makeGrid();
				
				fn_loadDataRequest();
			}
		);
	</script>
</body>

</html>