<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Description" content="Michał Ruciński private academy" />
<meta name="Keywords"
	content="music, school, piano, guitar, lessons, java, programming, musician, teacher, training" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>M.R.Academy</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div id="container">
		<nav>
			<c:set scope="request" var="log" value="Zaloguj" />
			<c:if test="${ user != null  && user.isLoggedIn() == true}">
			<c:set scope="request" var="log" value="${ user.getName() }"/>
			</c:if>
			<a class="menu" href="/m.r.academy/MusicSchool?action=index">Akademia</a><a class="menu" href="/m.r.academy/MusicSchool?action=classes">Klasy</a><a class="menu" href="/m.r.academy/MusicSchool?action=levels">Poziomy</a><a class="menu" href="/m.r.academy/MusicSchool?action=aboutme">O mnie</a><a class="menu" href="/m.r.academy/MusicSchool?action=login">${ log }</a>
		</nav>