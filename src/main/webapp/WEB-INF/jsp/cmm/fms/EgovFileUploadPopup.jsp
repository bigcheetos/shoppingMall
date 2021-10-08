<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <script type="text/javascript"
	src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script> --%>
<title>Insert title here</title>

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
	<br>
	<br>
	<br>
	
	<h2>파일 업로드</h2>
	<form id="frm2" action="<c:url value='/cmm/fms/fileUpload.do'/>"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="savePath" value="Globals.fileStorePath" />
		<table width="400px" cellspacing="0" cellpadding="0" border="1">
			<tr>
				<c:choose>
					<c:when test="${param.imgFile eq 'true'}">
					<td><input class="btn" type="file" name="file1" accept=".gif,.jpg,.png,.bmp" onchange="fn_checkFile(this)"></td>	
					</c:when>
				
					<c:otherwise>
					<td><input class="btn" type="file" name="file1"></td>
					</c:otherwise>
				</c:choose>
				
			</tr>
			<tr>
				<td align="center">
					<input id="btn-submit" type="button" onClick="onBtnSubmit()" value="저장">
					<input id="btn-close" type="button" onclick="window.close()" value="닫기">
				</td>
			</tr>
		</table>
	</form>
	<p>
	<p>
	<p>
		<!-- <a href="javascript:fn_egov_downFile('FILE_000000000000201','0')"> -->
		<!-- <a href="#">파일 다운로드 </a> -->
		<script>
			/* function fn_egov_downFile(atchFileId, fileSn) {
				window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="
						+ atchFileId + "&fileSn=" + fileSn + "'/>");
			} */
			
			const form = document.querySelector('#frm2');
			
			var onBtnSubmit = function(){
				var data = new FormData(form);
				fn_uploadFileRequest(data);
		    }
			
			// 용량체크
			var fn_checkFile = function(el) {
				// files 로 해당 파일 정보 얻기.
				var file = el.files;

				// file[0].size 는 파일 용량 정보입니다.
				if(file[0].size > 1024 * 1024 * 5){
					// 용량 초과시 경고후 해당 파일의 용량도 보여줌
					alert('5MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
				}

				// 체크를 통과했다면 종료.
				else return;

				el.outerHTML = el.outerHTML;
			}
			
			var fn_uploadFileRequest = function(data) {
				// 그리드 데이터 업로드 요청
				fn_uploadFile(data)
				.then(function (datums) {
					console.log(datums);
					fn_closePopup(datums);
				})
				.catch(function (err) {
					console.error(err.statusText);
				});
			}
			
			//데이터 내보내기
			var fn_uploadFile = function(data) {
			  return new Promise((resolve, reject) => {
				const xhr = new XMLHttpRequest();
				//xhr.responseType = 'json';
				
				xhr.open('POST',
						'/cmm/fms/fileUpload.do',
						true);
				xhr.send(data);

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
		
		var fn_closePopup = function(result) {
			try {
		        window.opener.fn_egovFileUploadPopupHandler(this, result);
		    } catch (err) {}
		}
		</script>
</body>
</html>