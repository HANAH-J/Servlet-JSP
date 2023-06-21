<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./script/jquery-3.7.0.js"></script>
</head>
<body>
	<h2>Ajax 실습 1</h2>
	<form action="#">
		아이디 : <input type="text" name="userid" id="userid">
		<button type="button" onclick="idChk()">중복체크</button><br>
		비밀번호 : <input type="text" name="userpwd" id="userpwd"><br>
		이름 : <input type="text" name="username" id="username"><br>
		
		<button type="button" onclick="sendJson()">JSON 전송</button>
		<button type="button" onclick="receiveJson()">데이터 받기</button>
		<button type="submit">회원가입</button>
	</form>
	
	<script type="text/javascript">
		function idChk() {
			// Ajax를 이용한 통신
			// 1. 요청을 받을 서블릿 위치
			// 2. 전송방식 : GET / POST
			// 3. 어떤 데이터를 전송할 것인가?
			// 4. 어떤 데이터를 수신할 것인가?
					
			$.ajax(
//				{이름:값, 이름:값, 이름:값...}
				{
					url:"ajaxTest01",
					type:"GET",
					data:{
						userid : $('#userid').val(),
						userpwd : 1234
					},
					dataType:"text", // 서버로부터 받아올 데이터 타입
					success:function(data){ // 서버와의 교류가 성공했을 때 실행할 함수
						alert(data);
					},
					error:function(){ // 서버와의 교류가 실패했을 때 실행할 함수
						alert('에러가 발생했습니다.');
					},
					complete:function(){ // 서버와의 교류가 성공이나 실패에 관계없이 실핼할 함수
						
					}
				}
			);
		}
		
		function sendJson() {
			// 다수의 데이터를 보내야 할 상황 => (객체)
			// XML 방식	->	JSON : 객체를 문자열화
			let userid = $('#userid').val();
			let userpwd = $('#userpwd').val();
			let username = $('#username').val();
			
			let userInfo = { // 다수의 데이터를 객체에 담은 것
					"userid" : userid,
					"userpwd" : userpwd,
					"username" : username
			};
			
			$.ajax({
				url:"ajaxTest01",
				type:"POST",
				data:{
					"userInfo" : JSON.stringify(userInfo)	// JSON 포장!
					//			 JSON.parse(JSON객체) => javascript 객체로 꺼내기
				}
			});
		}
		
		function receiveJson() {
			// 서버로부터 JSON 데이터 받아오기
			$.ajax({
				url:"ajaxTest02",
				type:"POST",
				dataType:"JSON",
				success:function(data){ // JSON 타입의 데이터를 읽어와서 자동으로 파싱처리
					$('#userid').val(data.userid);
					$('#userpwd').val(data.userpwd);
					$('#username').val(data.username);
				}
			});
		}
	</script>
</body>
</html>