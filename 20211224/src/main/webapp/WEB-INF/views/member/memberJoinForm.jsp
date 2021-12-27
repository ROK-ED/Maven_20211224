<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div align="center">
		<div><h1>회원가입</h1></div>
		<div>
			<form id="frm" action="memberJoin.do" onsubmit="return formCheck()" method="post" enctype="multipart/form-data">
				<div>
					<table border="1">
						<tr>
							<th width="150">* 아이디</th>
							<td width="300">
								<input type="email" id="id" name="id" required="required" placeholder="Enter email...">
								&nbsp;&nbsp;<button type="button" id="idCheck" value="No" onclick="ajaxIdCheck()">중복체크</button>
							</td>
						</tr>
						<tr>
							<th width="150">* 패스워드</th>
							<td width="300">
								<input type="password" id="password" name="password" required="required" placeholder="Enter password...">
							</td>
						</tr>
						<tr>
							<th width="150">* 패스워드확인</th>
							<td width="300">
								<input type="password" id="password1" name="password1" required="required" placeholder="Enter check password...">
							</td>
						</tr>
						
						
						<tr>
							<th width="150">* 이 름</th>
							<td width="300">
								<input type="text" id="name" name="name" required="required" placeholder="Enter Your name...">
							</td>
						</tr>
						
						
						<tr>
							<th width="150">전화번호</th>
							<td width="300">
								<input type="tel" id="tel" name="tel">
							</td>
						</tr>
						<tr>
							<th width="150">주소</th>
							<td width="300">
								<input type="text" id="address" name="address">
							</td>
						</tr>
						<tr>
							<th width="150">사진</th>
							<td width="300">
								<input type="file" id="file" name="file">
							</td>
						</tr>
					</table>
				</div><br>
				<div>
					<input type="submit" value="회원가입">&nbsp;&nbsp;
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function ajaxIdCheck () {
			$.ajax({
				url : "ajaxIdCheck.do",
				type : "post",
				data : {"id" : $("#id").val()},
				dataType : "text",
				success : function (str) {
					/* console.log(str); */
					if(str == '0'){
						alert("이미 존재하는 아이디 입니다.");
						$("#id").val('');
						$("#id").focus();
					} else {
						alert("사용 가능한 아이디 입니다.");
						$("#idCheck").val('Yes');
						$('#idCheck').hide();
						$('#password').focus();
					}
				},
				error : function () {
					alert("이이디 중복 체크 과정에서 오류가 발생했다.");
				}
			});
		}
		
		function formCheck() {
			if($("#idCheck").val() == 'No') {
				alert("아이디 중복 체크를 해 주세요.")
				return false;
			}
			
			if($("#password").val() != $("#password1").val()) {
				alert("패스워드가 일치하지 않습니다.")
				$("#password").val('');
				$("#password1").val('');
				$("#password").focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>