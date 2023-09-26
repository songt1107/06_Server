<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
	<form action="/signup" method="get" onsubmit="return validate()">
        <fieldset>
            <legend>회원 가입</legend>

            <table>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" id="inputId">
                    </td>
                    <td>
                        <button id="check">중복확인</button>
                        <input type="hidden" name="idDuplication" value="idUncheck">
                    </td>
                </tr>
                <tr>
                    <td>패스워드</td>
                    <td>
                        <input type="password" id="inputPw">
                    </td>
                    <td>
                        <span id="pwMessage"></span>
                    </td>
                </tr>
                <tr>
                    <td>패스워드확인</td>
                    <td>
                        <input type="password" id="inputPwConfirm">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>
                        <input type="text" id="inputNickname">
                    </td>
                    <td>
                        <span id="nameMessage"></span>
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td class="btn-area">
                        <button type="reset">초기화</button>
                        <button>회원가입</button>
                    </td>
                    <td></td>
                </tr>
            </table>
        </fieldset>
    </form>
		
	<script src="/resources/js/signup.js"></script>
	
</body>
</html>