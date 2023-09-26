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
	
	<div class="content">
	
		
			<section class="content">
		            
		            <c:choose>
		            	
		            		<c:when test="${empty sessionScope.loginMember}">
				            	<form action="/member/login" method="post" name="login-form" id="loginFrm">
				                    
				                	<div>
									<h1 class="todoFont">투 두 리스트 로그인</h1>
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
				                        </section>
				                            <a href="/signup" class="signup">회원가입</a>
				                    </fieldset>
				                        
				                </form>
		            		</c:when>
		            		
		            		
		            		<%-- 로그인이 되었을때 --%>
		            		<c:otherwise>
		            			<h1 class="todoFont">${loginMember.getMemberNickname()}의 투 두 리스트</h1>
		            			
		            			<div>
		            			111
		            			</div>
		            			<form action="/member/logout" method="get" name="logout-form" id="logoutFrm">
			            			<section class="buttonarea">
			            				<button id="logoutbutton">로그아웃</button> <br>
			            			</section>
		            			</form>
		            		
		            		</c:otherwise>
		            		
		            </c:choose>
		            	
		        <c:if test="${not empty sessionScope.message}">

					<script>
						alert('${message}') // ${message}
					</script>
				
					<c:remove var="message" scope="session"/>

				</c:if>
			</section>
			
	</div>
            
</body>
</html>