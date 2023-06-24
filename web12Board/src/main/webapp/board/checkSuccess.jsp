<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		// alert('암호 확인 성공');
		
		// 수정으로 갈지, 삭제로 갈지
		if(window.name == 'update'){
			window.opener.parent.location.href='bs?command=board_update_form&num=${param.num}';
		}else if(window.name == 'delete'){
			window.opener.parent.location.href='bs?command=board_delete&num=${param.num}';
			alert('삭제가 되었습니다.');
		}
		
		window.close(); // 팝업창 닫기
	</script>
</body>
</html>