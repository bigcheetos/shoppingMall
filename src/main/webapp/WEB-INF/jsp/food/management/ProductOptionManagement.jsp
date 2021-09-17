
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Category</title>

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
	
<section class="category">
	<div class="container">
	<!-- 버튼 -->
	<div id="commonSearchDiv_container"></div>
    
    <div id="updateRows" style="height:100px;border:1px solid #f4f4f4;margin:5px 0"></div>
    
    <!-- 그리드 -->
    <div class="grid-wrapper">
        <div style="width: 100%; height:580px" id="myGrid" class="ag-grid-div ag-theme-balham ag-basic"></div>
        <!-- <div style="width: 20%; height: 580px; float: right" id="selectedRowImg"></div> -->
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://unpkg.com/ag-grid/dist/ag-grid.min.js"></script>
	<script src="/js/react/agGridUtil.js?ver=01"></script>
	
	<script src="/js/react/commonFunctions.js?ver=324"></script>

	<script>
		
		var updateRows 	= []; // 신규,수정
		var removedRows = []; // 삭제
		
		var stockList		= [];	// 재고
		var stockMap		= {};	// 재고
		var atchFileList	= [];	// 첨부파일
		var atchFileMap		= {};	// 첨부파일
		
		var mainGrid;	// 메인그리드
		var columnDefs;	// 그리드 컬럼정보	
	
		var fn_makeGrid = function() {
			// 그리드1 컬럼 정보
			columnDefs = [ {
				checkboxSelection : true
			},
			{
				headerName : "제품 코드",
				field : "optionCode",
				width : 150,
				hide : false,
				editable : true
			}, 
			{
				headerName : "재고명",
				field : "stockId",
				width : 200,
				cellEditor: 'select',
	            cellEditorParams: {
	               values: extractValues(stockMap)
	            },
	            filter: 'agSetColumnFilter',
	            refData: stockMap,
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
				editable : false
			},
			{
				headerName : "파일명",
				field : "atchFileId",
				width : 100,
				cellEditor: 'select',
	            cellEditorParams: {
	               values: extractValues(atchFileMap)
	            },
	            filter: 'agSetColumnFilter',
	            refData: atchFileMap,
				editable : true
			}, 
			{
				headerName : "옵션명",
				field : "optionName",
				width : 100,
				hide : false,
				editable : true
			}, 
			{
				headerName : "옵션가격",
				field : "optionPrice",
				width : 200,
				hide : false,
				/* valueFormatter: params => params.data.number.toFixed(0), */
				editable : true
			}, 
			{
				headerName : "사용여부",
				field : "optionStatus",
				width : 100,
				hide : false,
				editable : true
			}, 
			/* {
				headerName : "이미지등록",
				field : "fileUploadButton",
				cellEditor: 'btnCellRenderer', 
			    width : 100,
			    editable : function(params) {
					return (params.data.rowType == "new")?true:false;
				}
			}, */
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
					/* // 그리드 컬럼 수정 여부 동적 제어
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
					} */
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
		// 데이터 가져오기
		var fn_loadDataRequest = function() {
			gfn_loadData('/cmm/main/management/getProductOptionList.do')
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
				optionCode : null,
				stockId : null,
				atchFileId : null,
				optionName : null,
				optionStatus : 'Y',
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
		
		function onBtSave() {
			fn_saveCheck();
		}
		
		// 저장시 필수체크
		var fn_saveCheck = function() {
			var savable = true;
			var edit_count = 0;
			/* mainGrid.gridOpts.api.forEachNode(function(rowNode, index) {
				if(rowNode.data.categoryName == ''
				|| rowNode.data.categoryOrder == ''
				|| (rowNode.data.categoryStatus != 'Y' && rowNode.data.categoryStatus != 'N')) {
					savable = false;
				};
				if (rowNode.data.edit) {
					edit_count++;
				}
				edit_count += removedRows.length;
			}); */
			
			/* if(edit_count==0) {
				alert("수정된 값이 없습니다.");
				return;
			} */
			
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
			fn_uploadDataRequest(uploadRows);
		}
		
		// 데이터 내보내기
		var fn_uploadDataRequest = function(updateRows) {
			// 그리드 데이터 업로드 요청
			gfn_uploadData(updateRows, '/cmm/main/management/registProductOption.do')
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
		
		var stockMapComplete = false;
		var atchFileMapComplete = false;
		
		var fn_setStockMap = function() {
			stockMap[0] = "재고 없음";
			
			for(var stock of stockList) {
				stockMap[stock.stockId] = stock.stockName;
			}
			
			// 맵 체크
			fn_checkMap();
		}
		
		var fn_setAtchFileMap = function() {
			atchFileMap[0] = "이미지 없음";
			
			for(var atchFile of atchFileList) {
				atchFileMap[atchFile.atchFileId] = atchFile.orignlFileNm;
			}
			
			// 맵 체크
			fn_checkMap();
		}
		
		var fn_checkMap = function() {
			// 맵 둘다 만들어지면
			if(stockMap[0] && atchFileMap[0]) {
				// 그리드 생성
				fn_makeGrid();
			}
		}
		
		// setup the grid after the page has finished loading
		document.addEventListener('DOMContentLoaded',
			function() {
				// 데이터 로드 => 맵 생성 => 그리드 생성
				
				// 재고명
				gfn_commonLoadDataRequest('/cmm/main/management/getStockList.do', stockList, fn_setStockMap);
				// 파일명
				gfn_commonLoadDataRequest('/cmm/main/management/getAtchFileListByAtchFileId.do', atchFileList, fn_setAtchFileMap);
				
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