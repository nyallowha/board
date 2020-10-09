<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 align="center">
	게시글 수정하기 
	</h1>
<c:forEach var="list" items="${boardlist}">
<div style="width: 50%; margin: auto;">
	<form action="boardmodifin" method="get">
	<table class="table table-hover" >
		<tr><th>글 제목</th><td><input type="text" name="title" 		 value="${list.title }"></td></tr>
		<tr><th>글 내용</th><td><input type="text" name="content" value="${list.content }"></td></tr>
		<tr><th>글 번호</th><td><input type="hidden"  name="boardno" value="${list.boardno }">${list.boardno }</td></tr>
		<tr><th>작성일</th><td><input type="hidden"  value="${list.boarddate }"><fmt:formatDate value="${list.boarddate}" pattern="yyyy년MM월dd일"></fmt:formatDate></td></tr>
		<tr><th>조회수</th><td><input type="hidden"  value="${list.hit }">${list.hit }</td></tr>
	</table>
	<div style="text-align: center; height: 50px">
			<input type="submit" class="btn btn-danger" value="수정완료">
	</div>
	</form>
	<div style="text-align: center;" >
		<button class="btn btn-primary" onclick="location.href='http://localhost/board.com'">게시판으로 돌아가기</button>
	</div>
</div>

</c:forEach>

</body>
</html>