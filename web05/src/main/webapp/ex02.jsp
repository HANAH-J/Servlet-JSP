<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 표현언어(EL표기법) 데이터를 출력
			-> 어떤 데이터 : 문자열, 정수, 실수, 논리형, null(공백)
			-> 표현 언어 내부에는 연산도 사용 가능
	 --%>
정수타입 : ${30}<br>
실수타입 : ${3.14}<br>
문자열타입 : ${"안녕하세요"}<br>
논리타입 : ${true}<br>
null : ${null}<br>

<hr>
5+2 : ${5+2}<br>
5-2 : ${5-2}<br>
5*2 : ${5*2}<br>
5/2 : ${5/2}<br>
5%2 : ${5%2}<br>

5 div 2 = ${5 div 2 }<br>
5 mod 2 = ${5 mod 2 }<br>

<hr>
5>2 : ${5>2}<br>
5>2 : ${5 gt 2}<br>
5<2 : ${5<2}<br>
5<2 : ${5 lt 2}<br>

<hr>
(5>2)? 5 : 2 => ${(5>2)?5:2}<br>
</body>
</html>