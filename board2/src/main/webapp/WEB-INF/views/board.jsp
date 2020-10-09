<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
<body>
<script type="text/javascript" >
function hello (){
	console.log('start');
}
$(document).ready(function(){
	var resultno =$('input.delesult').val();
	//console.log(resultno+'delesult의 값');
		
	if(resultno ==3){
		alert('삭제가 완료되었습니다.!');
	}
	else if (resultno ==2)
		{
		 alert("삭제할 페이지가 없었습니다")
		}
	
});



</script>
<h4 align="center">게시판</h4>
<input type="text" class = "delesult" value="${param.resultno}"/>
<table class="table table-hover"  style="width: 50%; margin: auto;">
 	<tbody><tr><th>글번호</th> <th>글제목</th><th>글내용</th><th>조회수</th><th>작성시간</th></tr>
<c:forEach items="${dtolist}" var="list" varStatus="status">
	<tr style="cursor: pointer;" onclick="location.href='board.com/detailview?boardno=${list.boardno}' "><td>${list.boardno }</td><td>${list.title }</td><td>${list.content }</td><td>${list.hit }</td><td><fmt:formatDate value="${list.boarddate}" pattern="yyyy년MM월dd일"></fmt:formatDate></td></tr>
</c:forEach>
</tbody>
</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${page.startPage != 1 }">
			<a href="/board?nowPage=${page.startPage - 1 }&cntPerPage=${page.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
			<c:choose>
				<c:when test="${p == page.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != page.nowPage }">
					<a href="/board?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${page.endPage != page.lastPage}">
			<a href="/board?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<div style="text-align: center;">
		<button class="btn btn-danger" onclick="location.href='/board.com/writePage'">글 쓰기</button>
	</div>
</body>
</html>