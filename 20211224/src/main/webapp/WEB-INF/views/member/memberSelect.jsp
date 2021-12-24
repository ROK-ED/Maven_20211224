<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<style type="text/css">
*{
	margin: 0;
	border: 1px solid gray;
}
</style>
</head>
<body>
<div align="center">
	<div><h1>회원상세정보</h1></div>
	<p>아이디 <strong>${member.id }</strong></p>
	<p>이름  <strong>${member.name }</strong></p>
	<p>비밀번호 <strong>${member.password }</strong></p>
</div>
</body>
</html>