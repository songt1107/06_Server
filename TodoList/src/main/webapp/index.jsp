<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodoList</title>

<link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
	
	<div class="container">
	
		
				<section class="content">
		            
		            	<c:choose>
		            	
		            		<%-- 로그인이 안되었을때 --%>
		            		<%-- EL empty : 비어있거나 null이면 true --%>
		            		
		            		<c:when test="${empty sessionScope.loginMember}">
				            	<form action="/member/login" method="post" name="login-form" id="loginFrm">
				                    
				                	<div>
									<h1 class="todoLogin">투 두 리스트 로그인</h1>
									</div>
							
				                    <fieldset class="id-pw-area">
				                        <section>
				                        	<p>아이디</p>
				                            <input type="text" name="inputId" placeholder="아이디">
				                            <p>패스워드</p>
				                            <input type="password" name="inputPw" placeholder="패스워드">
				                        </section>
				                        <br>
				                        <section class="buttonarea">
				                            <button id="loginbutton">로그인</button> <br>
				                            <a href="/signup" class="signup">회원가입</a>
				                        </section>
				                    </fieldset>
				
				                </form>
		            		</c:when>
		            		
		            		<%-- 로그인이 되었을때 --%>
		            		<c:otherwise>
		            			<p>유저일의 투두리스트</p>
		            		
		            		
		            		</c:otherwise>
		            		
		            	</c:choose>
		            	
				</section>
			
	</div>
            
</body>
</html>