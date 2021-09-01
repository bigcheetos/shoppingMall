
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
<title>Stock</title>

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
			<div style="padding: 2px;">
				<div style="float: left">
					<button type="button" class="btn btn-secondary"
						onclick="onBtSelectAll()">전체선택</button>
					<button type="button" class="btn btn-secondary"
						onclick="onBtDeselectAll()">선택취소</button>
					<button type="button" class="btn btn-secondary"
						onclick="onBtUpdateStock()">재고량 업데이트</button>
				</div>
				<div style="float: left">&nbsp; &nbsp;</div>
				<div style="float: left">&nbsp; &nbsp;</div>
				<div style="float: right">
					<button type="button" class="btn btn-primary"
						onclick="onBtSearch()">조회</button>
					<button type="button" class="btn btn-success"
						onclick="onBtAddBottom()">신규</button>
					<button type="button" class="btn btn-warning" onclick="onBtSave()">저장</button>
					<button type="button" class="btn btn-danger" onclick="onBtDelete()">삭제</button>
				</div>

			</div>
			<div id="updateRows"
				style="height: 100px; border: 1px solid #f4f4f4; margin: 5px 0"></div>
			<div class="grid-wrapper">
				<div style="width: 35%; height: 580px; float: left" id="myGrid"
					class="ag-grid-div ag-theme-balham ag-basic"></div>
				<div style="width: 55%; height: 580px; float: right" id="myGrid2"
					class="ag-grid-div ag-theme-balham ag-basic"></div>
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
	<script src="/js/react/agGridUtil.js?ver=1"></script>

	<script>

		// 그리드1 컬럼 정보
		var columnDefs1 = [ 
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
		var columnDefs2 = [ {
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
						console.log(event.node.selected);
						
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
							fn_load_data2_request(event.data.stockId);
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
			// fn_load_data_request();
			
			// 그리드1의 첫번째행 선택
			mainGrid.gridOpts.api.selectIndex(0);
		}
		// 그리드 1 조회
		function fn_serachRows(rowData) {
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
			} else {
				mainGrid.makeGrid(rowData);
				
				// 최초 로딩시 그리드1의 첫번째행 선택
				mainGrid.gridOpts.api.updateRowData({add: [firstRow], addIndex:0});
				mainGrid.gridOpts.api.selectIndex(0);
			}
		}
		// 그리드 2 조회
		function fn_serachRows2(rowData) {
			var eGridDiv = document.querySelector('#myGrid2');
			if(eGridDiv.hasChildNodes()) {
				fn_gridRefresh2(rowData);	
			} else {
				mainGrid2.makeGrid(rowData);
			}
		}
		
		/*	리프레쉬	*/
		function fn_gridRefresh(rowData) {
			mainGrid.gridOpts.api.refreshCells();
			mainGrid.gridOpts.api.setRowData(rowData);
		}
		
		function fn_gridRefresh2(rowData) {
			mainGrid2.gridOpts.api.refreshCells();
			mainGrid2.gridOpts.api.setRowData(rowData);
			
			// 삭제된 행 초기화
			removedRows = [];
		}
		
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
		
		// 그리드2 데이터 로드
		function fn_load_data2(stockId) {
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
		function fn_load_data2_request(stockId) {
			fn_load_data2(stockId)
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
		// 삭제
		var removedRows = [];
		
		function onBtDelete() {
			fn_deleteRows();
		}
		
		function fn_deleteRows() {
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
		
		/*	저장	*/
		var updateRows = [];
		function onBtSave() {
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
		
		function fn_saveRows() {
			mainGrid2.gridOpts.api.stopEditing();
			mainGrid2.gridOpts.api.forEachNode(function(rowNode, index) {
				if (rowNode.data.edit) {
					updateRows.push(rowNode.data);
				}
			});
			var uploadRows = Object.assign(updateRows, removedRows);
			
			$("#updateRows").html(JSON.stringify(uploadRows));
			fn_upload_data_request(uploadRows);
		}
		
		// 그리드2 데이터 내보내기
		function fn_upload_data(updateRows) {
		  return new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest();
			//xhr.responseType = 'json';
			
			xhr.open('POST',
					'/cmm/main/management/registStockIo.do',
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
		  });
		}
		function fn_upload_data_request() {
			// 그리드2 데이터 업로드 요청
			fn_upload_data(updateRows)
			.then(function (datums) {
				console.log(datums);
				fn_load_data2_request(mainGrid.gridOpts.api.getSelectedRows(0)[0].stockId);
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
			// 필수체크
			// 선택된 행이 없으면 불가능
			if(mainGrid.gridOpts.api.getSelectedNodes(0)[0] == null) {
				return;
			}
			
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
					fn_update_stock_request();
				};
			} else {
				alert("저장할 값이 잘못 되었습니다. 확인 해주십시오.");	
			};
		}
		
		function fn_update_stock_request() {
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
			
			// 수정값 넣기
			var updateStockRow = [{
				stockId : mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockId,
				stockName : mainGrid.gridOpts.api.getSelectedNodes(0)[0].data.stockName,
				stockAmt : stockInputAmtSum,
				rowType : "updated"
			}]
			
			
			// 재고량 데이터 업로드 요청
			fn_upload_stock_data(updateStockRow)
			.then(function (datums) {
				console.log(datums);
				fn_load_data_request();
				alert("저장이 완료되었습니다!");
			})
			.catch(function (err) {
				console.error(err.statusText);
			});
		}
		
		// 재고량 데이터 내보내기
		function fn_upload_stock_data(updateStockRow) {
		  return new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest();
			//xhr.responseType = 'json';
			
			xhr.open('POST',
					'/cmm/main/management/registStock.do',
					true);
			xhr.setRequestHeader("Content-Type",
					"application/json");
			
			xhr.send(JSON.stringify(updateStockRow));
			
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