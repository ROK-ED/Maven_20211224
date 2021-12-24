<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>회원목록 리스트</h1>
		</div>
		<%-- 	<div>
		이부분에 회원 목록이 나오면 됩니다.<br>
		<c:forEach items = "${members }" var="member">
			${member.id } : ${member.password }<br>
		</c:forEach>
		<button type="button" onclick="location.href='home.do'">홈으로</button>
	</div> --%>
		<div>
			<table border="1">
				<tr>
					<th width="100">아이디</th>
					<th width="100">이 름</th>
					<th width="100">전화번호</th>
					<th width="250">주소</th>
					<th width="100">권한</th>
				</tr>
				<c:forEach items="${members }" var="member">
					<tr onmouseover='this.style.background="#F3F781"'
						onmouseleave='this.style.background="white"'
						onclick="memberSelect('${member.id }')">
						<td align="center">${member.id }</td>
						<td align="center">${member.name }</td>
						<td align="center">${member.tel }</td>
						<td align="center">${member.address }</td>
						<td align="center">${member.author }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<div>
			<button type="button" onclick="location.href='home.do'">홈 가기</button>
			&nbsp;&nbsp;&nbsp;
		</div>
		<div>
			<form id="frm" action="memberSelect.do" method="post">
				<input type="hidden" id="id" name="id">
				<!-- 사용처           자바스크립트     자바-->
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function memberSelect(str) {
			frm.id.value=str;
			frm.submit();
		}
	</script>
</body>
</html>