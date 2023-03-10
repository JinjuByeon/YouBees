<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/resources/css/write.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>YouBees</title>
    <link rel="icon" href="${path}/resources/favicon.ico" type="image/x-icon">
</head>

<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	    
	    $(".imgCnt").text("1/1");
	    
	  } else {
	    document.getElementById('preview').src = "${path}/resources/source/background.png";
	  }
	}


function resetimg() {
	$("#file_input").val("");
	$("#preview").attr("src", "${path}/resources/source/background.png");
	$(".imgCnt").text("0/1");
}
//<img id="preview" class="uploadedFile" name="photo_file"/>
</script>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="main_container">
        <form action="update.bo" method="post" class="write_form" enctype="multipart/form-data">
            <div class="name_box">
                <label for="name_content">
                    <input type="text" id="name_contnet" name="title" placeholder="제목을 입력해 주세요." value="${b.title}">
                    <input type="hidden" name="bnum" value="${b.bnum }">
                </label>
            </div>
			<%-- <input type="hidden" name="cusNum" value="${loginUserC.cusNum}"> --%>
			
            <div class="service_region">
                <select class="service_box" name="serviceNum" id="select_service">
                    <option value="service">(선택) 서비스</option>
                    <option value="1">통번역</option>
					<option value="2">마케팅</option>
					<option value="3">컨설팅</option>
					<option value="4">보안</option>
					<option value="5">인쇄</option>
					<option value="6">기타</option>
                </select>
          
                
                <select class="region_box" name="location" id="select_region">
                    <option value="">(선택) 지역</option>
					<option value="서울">서울</option>
					<option value="세종">세종</option>
					<option value="강원">강원</option>
					<option value="인천">인천</option>
					<option value="경기">경기</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
					<option value="경북">경북</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="전북">전북</option>
					<option value="경남">경남</option>
					<option value="울산">울산</option>
					<option value="광주">광주</option>
					<option value="부산">부산</option>
					<option value="전남">전남</option>
					<option value="제주">제주</option>
                </select>
            </div>
		<script>
			$("#select_service").val("${b.serviceNum}");
			$("#select_region").val("${b.location}")
		</script>
		
		
            <textarea class="content_write" name="content">${b.content}</textarea>
	
            <div class="image_upload">
               <%--  <label for="file_input">
                    <img src="${path}/resources/source/camera.png" class="camimg" />
                </label> --%>

				<label for="file_input">
                    	<img src="${path}/resources/source/camera.png" class="camimg" />
                </label>
                
				<c:choose>
					<c:when test="${ not empty b.originName }">
						<input id="file_input" type="file" name="reupfile" onchange="readURL(this);"/>
						<span class="imgCnt">0/1</span>
               			 <img id="preview" class="uploadedFile" name="photo_file" src="${path}/${b.changeName}"/>
					</c:when>
					<c:otherwise>
						<input id="file_input" type="file" name="reupfile" onchange="readURL(this);"/>
						<span class="imgCnt">0/1</span>
               			 <img id="preview" class="uploadedFile" name="photo_file"/>
					</c:otherwise>
				</c:choose>
               
                
                <button type="button" value="초기화 버튼" id="filecancle" onclick="resetimg();">x</button>
            </div>
            <div class="btn_container">
                <button type="submit" class="postBtn">수정하기</button>
                <button type="button" class="listBtn" onclick="javascript:history.back()">이전으로</button>
            </div>
        </form>
    </div>
    
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>