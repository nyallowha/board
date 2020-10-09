<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>게시글 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<h1 align="center">
게시글 상세보기
</h1>
<c:forEach var="list" items="${boardlist}">
<table class="table table-hover"  style="width: 50%; margin: auto;">

	<tr><th>글 제목</th><td>${list.title }</td></tr>
	<tr><th>글 내용</th><td>${list.content }</td></tr>
	<tr><th>글 번호</th><td>${list.boardno }<input type="hidden"id="boardno" value="${list.boardno}"></td></tr>
	<tr><th>작성일</th><td><fmt:formatDate value="${list.boarddate}" pattern="yyyy년MM월dd일"></fmt:formatDate></td></tr>
	<tr><th>조회수</th><td>${list.hit }</td></tr>
</table>
<div align="center" style="text-align: center;">
	<div style="float:center;">
		<button class="btn btn-primary" onclick="location.href='http://localhost/board.com'">게시판으로 돌아가기</button>
		<button class="btn btn-warning" onclick="location.href='http://localhost/board.com/modiboard?boardno=${list.boardno}'">수정하기</button>
		<button class="btn btn-danger"  id="delok" onclick="location.href='http://localhost/board.com/delboard?boardno=${list.boardno}">삭제하기</button><!-- "'" -->
		<script src="../resources/delboard.js"></script>
	</div>

</div>
</c:forEach>
</body>
</html>
