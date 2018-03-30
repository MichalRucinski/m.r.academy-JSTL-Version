<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="beans.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Description" content="Michał Ruciński private academy" />
<meta name="Keywords"
	content="music, school, piano, guitar, lessons, java, programming, musician, teacher, training" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>M.R.Academy -Strona użytkownika</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div id="container">
		<c:set scope="request" var="log" value="Zaloguj" />
		<c:if test="${ user != null  && user.isLoggedIn() == true}">
			<c:set scope="request" var="log" value="${ user.getName() }" />
		</c:if>

		<c:choose>
			<c:when test="${empty user || user.isLoggedIn() == false}">
				<nav>
				<a class="menu" href="/m.r.academy/MusicSchool?action=index">Akademia</a><a class="menu" href="/m.r.academy/MusicSchool?action=classes">Klasy</a><a class="menu" href="/m.r.academy/MusicSchool?action=levels">Poziomy</a><a class="menu" href="/m.r.academy/MusicSchool?action=aboutme">O mnie</a><a class="menu" href="/m.r.academy/MusicSchool?action=login">${ log }</a>
				</nav>

				<br />
				<article>
					<p>Wpisz swój login i hasło:</p>
					<form method="post"
						action="/m.r.academy/MusicSchool?action=dologin">
						<input type="hidden" name="action" value="dologin" /> 
						<input type="text" name="login" /> 
						<input type="password" name="password" /> 
						<input type="submit" value="Zaloguj" />
					</form>
					<p>${message}</p>
				</article>
				<br />
				<div id="imagesfrontpage">
					<img id="piano" src="piano.jpg" alt="PIANO" /><img id="guitar"
						src="gitara.jpg" alt="GUITAR" /><img id="notes" src="notes.jpg"
						alt="SHEETMUSIC" />
				</div>
				<br />

			</c:when>

			<c:when test="${not empty student}">

				<nav>
					<a class="menu" href="/m.r.academy/MusicSchool?action=index">Akademia</a><a class="menu" href="/m.r.academy/MusicSchool?action=classes">Klasy</a><a class="menu" href="/m.r.academy/MusicSchool?action=levels">Poziomy</a><a class="menu" href="/m.r.academy/MusicSchool?action=aboutme">O mnie</a><a class="menu" href="/m.r.academy/MusicSchool?action=logout">Wyloguj</a>
				</nav>
				<br />
				<p>Witaj, ${student.name}! Oto twój prywatny internetowy zeszyt
					ćwiczeń.</p>
				<br />
				<c:set scope="request" var="levelArray"
					value="${student.getLevel()}" />
				<c:set scope="request" var="trophyArray"
					value="${student.getTrophy(levelArray[0])}" />

				<div id="user">
					<div style="background-color: #444444">
						<img style="width: 100%" alt="trophy"
							src="/m.r.academy/img/${trophyArray[0]}.png">
					</div>
					<p>${student.name}</p>
					<p>${student.studentsClass}</p>
					<p>Level ${levelArray[0]}</p>
					<p>Points: ${levelArray[1]}/${levelArray[2]}</p>
					<p>${student.getPercentOfLevelCompleted(levelArray[1], levelArray[2])}%
						lvl completed</p>
					<p>${trophyArray[1]}</p>
				</div>

				<div id="usersheet">
					<textarea>
					${student.text}
					</textarea>

				</div>

			</c:when>
			<c:otherwise>
				<c:redirect url="/UserPage"></c:redirect>
			</c:otherwise>
		</c:choose>
		<footer style="clear: both">
			<p>M.R.Academy 2018. All rights reserved.</p>
			<p>Michał Ruciński 2018.</p>
		</footer>
	</div>
</body>
</html>