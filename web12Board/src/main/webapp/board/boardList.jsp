<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="style/board.css">
</head>
<body>
	<div id="wrap">
		<h1>게시물 목록</h1>
		<table class="list">
			<tr>
				<td colspan="5" style="border: white; text-align: right;">
					<a href="bs?command=board_write_form">게시물 등록</a>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${lists}" var="board">
				<tr>
					<td>${board.num}</td>
					<td><a href="bs?command=board_view&num=${board.num}">${board.title}</a></td>
					<td>${board.name}</td>
					<td><fmt:formatDate value="${board.writeDate}"/></td>
					<td>${board.readCount}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="cls2"> <!-- 페이징 처리 -->
			<c:if test="${totalCnt != null}">
				<c:choose>
					<c:when test="${totalCnt > 100}"> <!-- 최대 게시글 개수가 100개 이상인 경우 -->
						<c:if test="${(section *100) < totalCnt}"> <!-- 다음 섹션이 존재하는 경우 -->
							<c:forEach var="page" begin="1" end="10" step="1">
								<!-- 이전 섹션 가기 버튼 -->
								<c:if test="${section > 1 && page == 1}">
									<a href="bs?command=board_list&section=${section-1}&pageNum=10"> << </a>
								</c:if>
								<a href="bs?command=board_list&section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
								<!-- 다음 섹션 가기 버튼 -->
								<c:if test="${page == 10}">
									<a href="bs?command=board_list&section=${section+1}&pageNum=1"> >> </a>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${(section *100) >= totalCnt}"> <!-- 다음 섹션이 존재하지 않는 경우 -->
							<c:forEach var="page" begin="1" end="${((totalCnt+9)-(section-1)*100)/10}" step="1">
								<!-- 이전 섹션 가기 버튼 -->
								<c:if test="${section > 1 && page == 1}">
									<a href="bs?command=board_list&section=${section-1}&pageNum=10"> << </a>
								</c:if>
								<a href="bs?command=board_list&section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
								<!-- 다음 섹션 가기 버튼 X -->
							</c:forEach>
						</c:if>
					</c:when>
					<c:when test="${totalCnt == 100}"> <!-- 최대 게시글이 100개인 경우 : 섹션 1개, 페이지번호 1 ~ 10까지 -->
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="bs?command=board_list&section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
						</c:forEach>
					</c:when>
					<c:when test="${totalCnt < 100}"> <!-- 최대 게시글이 100개 미만인 경우 : 섹션 1개, 페이지번호 10보다 적은 수까지 -->
						<c:forEach var="page" begin="1" end="${(totalCnt +9)/10}" step="1">
							<a href="bs?command=board_list&section=${section}&pageNum=${page}">${page}</a>
						</c:forEach>
					</c:when>
				</c:choose>
			</c:if>
		</div> <!-- 페이징 처리 -->
	</div>
</body>
</html>