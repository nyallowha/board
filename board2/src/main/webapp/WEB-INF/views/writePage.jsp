<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
</head>
<body>
	<h3 align="center">글쓰기 페이지</h3>
	
	<form action="/board.com/writefin" method="get" >
		<table style="text-align: center; width: 100% " >
			<tr>
				<td>제목 <input type="text" name="boardtitle"/></td>
			</tr>
			<tr>
				<td>내용 <textarea cols="20" rows="2" name="boardcontent">내용을 입력하세요!</textarea></td>
			</tr>
		</table>
		<div align="center">
		<input type="submit" class="btn btn-primary" value="작성하기"/> <a href="http://localhost/board" class="btn btn-info" >게시글 페이지로</a>
		</div>
	</form>
</body>
</html>