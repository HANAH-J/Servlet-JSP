<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<link rel="stylesheet" href="./style/product.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>상품 수정 페이지 - 관리자</h1>
		<form action="productUpdate" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td rowspan="4">
						<c:choose>
							<c:when test="${empty product.pictureurl}">
								<img alt="이미지없음" src="/images/noimage.jsp">
								<!-- 이미지 경로를 C:\\Repository를 호출하면 CORS[과제] 에러 발생 -->
								<!-- server.xmp 위치에 경로 등록
									 <Context docBase="이미지폴더의 절대경로" path="/images" /> -->
							</c:when>
							<c:otherwise>
								<img alt="${product.pictureurl}" src="/images/${product.pictureurl}">
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="code" value="${product.code}">
					</td>
					<th>상품명</th>
					<td><input type="text" name="name" value="${product.name}"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="number" name="price" value="${product.price}"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<input type="file" name="pictureurl"><br>
						(주의 사항 : 이미지를 변경하고자 할 때만 선택하세요.)
						<input type="hidden" name="originPic" value="${product.pictureurl}">
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td><textarea rows="10" cols="80" name="description">${product.description}</textarea></td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="submit">변경</button>
						<button type="reset">다시작성</button>
						<button type="button" onclick="location.href='productList'">목록보기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>