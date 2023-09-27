<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>todoList메인화면</title>

<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
</head>

<body>

	<c:if test="${not empty sessionScope.msg}">

		<script>
			alert('${msg}')
		</script>

		<c:remove var="msg" scope="session"/>

	</c:if>
	
	<c:choose>

		<c:when test="${empty sessionScope.member}">

			<p class="todoFont">투 두 리스트 로그인</p>

			<fieldset class="loginContainer">
			
				<form action="/login" method="post">
					
					<br>
					<div>
						<p>아이디</p>
						<input type="text" name="inputId">
					</div>
					
					<br>
					
					<div>
						<p>패스워드</p>
						<input type="password" name="inputPw">
					</div>

					<button class="loginBtn" style="margin-left: 50px;">로그인</button> 
				
				</form>
				
				<a class="textFont" href="/signup" style="text-decoration: none; margin-left: 23px">회원가입</a>
			
			</fieldset>

		</c:when>

		<c:otherwise>

			<p class="todoFont" id="todolistTitle">${member.memberNickname}의 투두 리스트</p>

			<span>
				<br>
				<table class="todoTable">
					<tr>
						<th class="textFont">번호&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th class="textFont">제목&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th class="textFont">할 일&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th class="textFont">작성 일시</th>
						<td style="display: none;"></td>
						<td style="display: none;"></td>
					</tr>
					
					<c:forEach var="todo" items="${list}" varStatus="vs">
						<tr>
							<td class="todoMemo">${vs.count}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td class="todoMemo">${todo.todoTitle}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td class="todoMemo">${todo.todoMemo}&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td class="todoMemo">${todo.todoDate}</td>
							<td class="todoBtn"><a href="/update?index=${vs.index}&todoNo=${todo.todoNo}" id="updateBtn">&nbsp;수정</a></td>
							<td class="todoBtn"><a href="/delete?index=${vs.index}" id="deleteBtn">&nbsp;삭제</a></td>
						</tr>
						
					</c:forEach>
					
				</table>
			</span>

			<br>
			
			<div class="btn">

				<a class="textFont" href="/deleteAll" id="deleteAll">전체삭제</a>&nbsp;&nbsp;
				<a class="textFont" href="/insert" id="insertBtn">등록하기</a>&nbsp;&nbsp;
				<a class="textFont" href="/logout" id="logoutBtn">로그아웃</a>&nbsp;&nbsp;
				<a class="textFont" href="/deleteMem" id="deleteMem">회원탈퇴</a>

			</div>

		</c:otherwise>

	</c:choose>

</body>

</html>