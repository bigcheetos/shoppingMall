
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
    <title>Stock</title>

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
	
<section class="stock">
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

	<script>
		var MainGrid = function() {
			var _this = this;
			/* grid 영역 정의 */
			this.gridDiv = "myGrid";
			/* grid 칼럼 정의 */
			this.getColumnDefs = function() {
				var columnDefs = [ {
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
				var gridOpt = CommonGrid.getDefaultGridOpt(columnDefs);
				gridOpt.rowSelection = 'multiple';
				/* gridOpt.isRowSelectable = function(rowNode){
				    return (rowNode.data.country != "Russia")? true:false;
				} */
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
		var mainGrid = new MainGrid();

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
		/*	조회	*/
		function onBtSearch() {
			// 조회조건이 있다면 여기서 체크
			fn_load_data_request();
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
		/* // 데이터 가져오기
		function fn_loadData() {
			var httpRequest = new XMLHttpRequest();
			httpRequest.responseType = 'json';

			httpRequest.open('POST',
					'/cmm/main/management/getStockList.do',
					true);
			httpRequest.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			httpRequest.send();

			httpRequest.onreadystatechange = function() {
				if (httpRequest.readyState === 4
						&& httpRequest.status === 200) {
					var httpResult = httpRequest.response; //JSON.parse(httpRequest.response);
					fn_serachRows(httpResult);
				}
			};
		} */
		
		// 그리드1 데이터 가져오기
		function fn_load_data() {
		  return new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest();
			xhr.responseType = 'json';

			xhr.open('POST',
					'/cmm/main/management/getStockList.do',
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
		// 그리드1 데이터 로드 요청
		function fn_load_data_request() {
			fn_load_data()
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
		// 삭제
		var removedRows = [];
		
		function onBtDelete() {
			fn_deleteRows();
		}
		
		function fn_deleteRows() {
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
		var updateRows = [];
		function onBtSave() {
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
		
		function fn_saveRows() {
			mainGrid.gridOpts.api.stopEditing();
			mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
				if (rowNode.data.edit) {
					updateRows.push(rowNode.data);
				}
			});
			var uploadRows = Object.assign(updateRows, removedRows);
			
			$("#updateRows").html(JSON.stringify(uploadRows));
			fn_upload_data_request(uploadRows);
		}
		
		// 데이터 내보내기
		function fn_upload_data(updateRows) {
		  return new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest();
			//xhr.responseType = 'json';
			
			xhr.open('POST',
					'/cmm/main/management/registStock.do',
					true);
			xhr.setRequestHeader("Content-Type",
					"application/json");
			xhr.send(JSON.stringify(updateRows));

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
		    
		    // xhr.send(JSON.stringify(updateRows));
		  });
		}
		function fn_upload_data_request(uploadRows) {
			// 그리드2 데이터 업로드 요청
			fn_upload_data(updateRows)
			.then(function (datums) {
				console.log(datums);
				alert("저장이 완료되었습니다!");
				updateRows = [];	// 업데이트 로우맵 초기화
				fn_load_data_request();
			})
			.catch(function (err) {
				console.error(err.statusText);
			});
		}
		// setup the grid after the page has finished loading
		document.addEventListener('DOMContentLoaded',
			function() {
				fn_load_data_request();
			}
		);
	</script>
</body>

</html>