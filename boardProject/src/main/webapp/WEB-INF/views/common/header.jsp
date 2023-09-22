<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/main-style.css">

<header>

	<section>
		<a href="#">
			<img src="/resources/images/logo.jpg" id="homeLogo">
		</a>
	</section>

	<section>
		<section class="search-area">
			<form action="/search" method="GET" name="search-form">
				<fieldset>
					<input type="search" id="query" name="query"
					autocomplete="off" placeholder="회원을 닉네임으로 검색해주세요."
					>
					<button id="searchBtn" class="fa-solid fa-magnifying-glass"></button>
				</fieldset>
			</form>
		</section>
	</section>
	
	<section></section>
	
</header>

<nav>
	<ul>
		<li><a href="#">공지사항</a>
		<li><a href="#">자유 게시판</a>
		<li><a href="#">질문 게시판</a>
		<li><a href="#">FAQ</a>
		<li><a href="#">1:1문의</a>
	</ul>
</nav>