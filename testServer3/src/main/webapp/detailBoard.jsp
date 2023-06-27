<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<style type="text/css">
	#commentList{
		list-style: none;
		padding-left: 0px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<h1>게시물 상세보기</h1>
		<table border="1">
			<tr>
				<th>글 번호</th>
				<td>1</td>
				<th>조회수</th>
				<td>123</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>호길동</td>
				<th>작성일</th>
				<td>2023-02-15</td>
			</tr>
			 <tr>
			 	<th>글 제목</th>
			 	<td colspan="3">test</td>
			 </tr>
			 <tr>
			 	<th>글 내용</th>
			 	<td colspan="3">test content</td>
			 </tr>
			 <tr>
			 	<td colspan="4">
			 		<button type="button">수정[더미버튼]</button>
			 		<button type="button">삭제[더미버튼]</button>
			 		<button type="button">목록보기[더미버튼]</button>
			 	</td>
			 </tr>
			 <tr>
			 	<td colspan="4">
			 		<button type="button" onclick="openWriteComment()">댓글 쓰기</button>
			 		<form action="" name="frm" id="frm" style="display: none;">
			 			<table>
			 				<tr>
			 					<td>작성자</td>
			 					<td><input type="text" name="user" id="user" size="5"></td>
			 					<td>암호</td>
			 					<td><input type="password" name="pass" id="pass" size="5"></td>
			 					<td><button type="button" onclick="writeComment()">댓글 등록</button></td>
			 				</tr>
			 				<tr>
			 					<td colspan="5">
			 						<textarea rows="5" cols="50" id="comment"></textarea>	 					
			 					</td>
			 				</tr>
			 			</table>
			 		</form>
			 	</td>
			 </tr>
			 <tr>
			 	<td colspan="4">
			 		<button type="button" onclick="openCommentList()">댓글 목록 보기</button>
			 		<ul id="commentList" style="display: none;">
			 			<c:forEach items="${lists}" var="comment">
			 				<li>
			 					<p>
			 						<span>${comment.commentUser}&nbsp;&nbsp;</span>
			 						
			 						<span id="check">
			 							<fmt:formatDate value="${comment.commentRegDate}"/>&nbsp;&nbsp;
			 							<button type="button" onclick="inputPassword()">댓글 수정하기</button>
			 						</span>
			 						<br>
			 						<textarea rows="5" cols="50" readonly="readonly">${comment.commentComment}</textarea>
			 					</p>
			 				</li>
			 			</c:forEach>
			 		</ul>
			 	</td>
			 </tr>
		</table>
	</div>
	
<script type="text/javascript">
// 주로 작성하게 될 코드
$(document).ready(function() { // window.onload = function(){}
	console.log('테스트');
});
	
function openWriteComment() {
	$('#frm').slideToggle();
}
	
function writeComment() {
	let commentInfo = {
			"commentUser" : $('#user').val(),
			"commentPassword" : $('#pass').val(),
			"commentComment" : $('#comment').val()
	}
		
	$.ajax({
		type: "POST",
		url: "writeComment",
		data: {
			"commentInfo": JSON.stringify(commentInfo)
		},
		success: function() {
			alert('저장 성공');
			$('#user').val(''),
			$('#pass').val(''),
			$('#comment').val('');
		}
	})
}
	
function inputPassword(obj) { // 암호 입력태그를 보여주는 함수
	let inputPass = $(obj).parent();
	// 화면에 찍힐 태그들을 만드는 작업 
	let input = $('<input>').attr('type', 'password')
							.attr('size', '10')
							.attr('id', 'checkPass');
	let btn = $('<button></button>').attr('type','button')
									.attr('onclick','check(this)')
									.html('암호 확인');
		
	// 만들어진 태그를 화면에 찍는 작업
	inputPass.fadeOut(400, function(){
		inputPass.html(''); // 기존의 내용 지우고
		inputPass.append(input); // 새로운 내용 채우기
		inputPass.append(btn);
		inputPass.fadeIn(400);
	})
}
	
function check(obj) { // Ajax를 이용해서 서버로 암호를 보내고 확인받는 함수
	// 암호, 댓글 번호를 서버로 보내야 한다.
	let pass = $(obj).prev().val();
	let num = $(obj).parent().parent().attr('num');
		
	$.ajax({
		type: "POST",
		url: "checkPass",
		data: {
			"commentPassword": pass,
			"commentCode": num
		}, dataType: "text",
		success: function(check) { // true라면 암호 일치, false라면 암호 불일치
			$(obj).prev().val(''); // 암호 입력 폼 비우기
			if(check == "true"){
				activation(obj); // 수정, 삭제 버튼이 활성화되는 함수
			}else{
				alert('비밀번호 오류');
			}			
		}
	});
}
	
function activation(obj) { // 수정, 삭제 버튼 활성화 함수
	// alert('암호 확인 성공');

	let update = $('<button></button>').attr('type', 'button')
									   .attr('onclick', 'updateComment(this)')
									   .html('수정');
	let del = $('<button></button>').attr('type', 'button')
	   								.attr('onclick', 'deleteComment(this)')
	   								.html('삭제');
		
	let target = $(obj).parent();
	target.fadeOut(400, function(){
		target.html(''); // 기존의 내용 지우고
		target.append(update); // 새로운 내용 채우기
		target.append(del);
		target.next().next().removeAttr('readonly');
		target.fadeIn(400);
	});
}
	
function updateComment(obj) { // 댓글 번호와 글 내용을 서버로 전송하면 변경
	let num = $(obj).parent().parent().attr('num');
	let comment = $(obj).parent().parent().children(':last').val();
	//				버튼	 span	  li	   마지막 자식요소:textarea
	
	$.ajax({
		type: "POST",
		url: "updateComment",
		data: {
			"commentCode": num,
			"commentComment": comment
		},
		success: function() {
			alert('수정 완료');
			$(obj).closest('ul').slideUp(); // 댓글 목록을 새로고침 하기 위해 닫아준다.
		}
	})
}
	
function deleteComment(obj) { // 댓글 번호만 서버로 전송하면 삭제
	let num = $(obj).parent().parent().attr('num');
	
	$.ajax({
		type: "POST",
		url: "deleteComment",
		data: {
			"commentCode": num
		},
		success: function() {
			alert('삭제 완료');
			$(obj).closest('ul').slideUp(); // 댓글 목록을 새로고침 하기 위해 닫아준다.
		}
	})
}
	
function openCommentList() { // Ajax를 이용해서 댓글 목록을 불러온 후 화면에 적용하는 함수
	$.ajax({
		type: "GET",
		url: "listComment",
		dataType: "JSON",
		success: function(commentList) {
			// 댓글 목록을 새로고침
			$('#commentList').empty(); // ul 태그 내부 비우기
			for(let i in commentList){
				// 화면에 찍힐 태그들을 만드는 작업
				let li = $('<li></li>').attr('num', commentList[i].commentCode);
				let spanName = $('<span></span>').html(commentList[i].commentUser + "&nbsp;&nbsp;");
				let btn = $('<button></button>').attr('type', 'button')
												.html('댓글 수정하기')
												.attr('onclick', 'inputPassword(this)');
				let spanDate = $('<span></span>').html(formatDate(commentList[i].commentRegDate) + "&nbsp;&nbsp;");
				let text = $('<textarea></textarea>').attr('rows', 5)
													 .attr('cols', 50)
													 .attr('readonly', 'readonly')
													 .html(commentList[i].commentComment);
				
				// 만들어진 태그를 화면에 찍는 작업
				li.append(spanName);
				spanDate.append(btn);
				li.append(spanDate);
					
				li.append('<br>');
				li.append(text);
					
				$('#commentList').append(li);
			}
		}
	}); // ajax 종료
	$('#commentList').slideToggle();
}
	
	function formatDate(date) {
		let d = new Date(date);
		
		let month = '' + (d.getMonth() + 1);
		let day = '' + (d.getDate());
		let year = '' + (d.getFullYear());
		
		if(month.length < 2){
			month = '0' + month; // 5월 -> 05
		}
		if(day.length < 2){
			day = '0' + day; // 5일 -> 05
		}
		return [year, month, day].join('-'); // 2023-05-05
	}
	</script>
</body>
</html>