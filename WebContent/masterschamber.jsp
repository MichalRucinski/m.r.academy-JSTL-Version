<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="database.Student, java.util.ArrayList"%>
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
<title>M.R.Academy - Kokpit szefa</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div id="container">
		<nav>
			<c:set scope="request" var="log" value="Log in" />
			<c:if test="${ user != null  && user.isLoggedIn() == true}">
			<c:set scope="request" var="log" value="${ user.getName() }"/>
			</c:if>
			<a class="menu" href="/m.r.academy/MusicSchool?action=index">Akademia</a><a class="menu" href="/m.r.academy/MusicSchool?action=classes">Klasy</a><a class="menu" href="/m.r.academy/MusicSchool?action=levels">Poziomy</a><a class="menu" href="/m.r.academy/MusicSchool?action=aboutme">O mnie</a><a class="menu" href="/m.r.academy/MusicSchool?action=logout">Wyloguj</a>
		</nav>
<c:choose>

	<c:when test="${not empty currentStudent}">

		<c:set scope="request" var="x" value="${requestScope.currentStudent}" />
		<c:set scope="request" var="levelArray" value="${x.getLevel()}" />
		<c:set scope="request" var="trophyArray" value="${x.getTrophy(levelArray[0])}" />
		<p style="color: red; text-align:center"><c:out value="${inscription}"></c:out></p>
		<div id="user">
			<div style="background-color: #444444">
				<img style="width: 100%" alt="trophy"
					src="/m.r.academy/img/${trophyArray[0]}.png">
			</div>
			<p>${x.getName()}</p>
			<p>${x.getStudentsClass()}</p>
			<p>Level ${levelArray[0]}</p>
			<p>Points: ${levelArray[1]}/${levelArray[2]}</p>
			<c:set scope="request" var="percent"
				value="${x.getTrophy(levelArray[0])}" />
			<p>${x.getPercentOfLevelCompleted(levelArray[1], levelArray[2])}%
				lvl completed</p>
			<p>${trophyArray[1]}</p>
		</div>

		<form action="/m.r.academy/MasterPage" method="post" style="text-align: right">			
			<div id="usersheet">
				<input type="hidden" name="action" value="textChange">				
				<input type="hidden" name="student" value="${x.login}">
				<textarea name="notes">${x.text}</textarea>
			</div>			
			<input type="submit" value="Zapisz notatkę" style="width: 200px" />
		</form>
		
		<div style="text-align: right; float: right; width: 200px">
		<div style="width: 200px">
		<form action="/m.r.academy/MasterPage" method="post">
			<input type="hidden" name="action" value="addPoints">
			<input type="hidden" name="student" value="${x.login}"/>
			<input type="text" name="addPoints"  style="width: 100px"/>
			<input type="submit" value="Dodaj punkty" style="width: 95px;" />
		</form>
		</div>
		
		<div style="width: 200px">
		<form action="/m.r.academy/MasterPage" method="post">
			<input type="hidden" name="action" value="takePoints">
			<input type="hidden" name="student" value="${x.login}"/>
			<input type="text" name="takePoints"  style="width: 100px"/>
			<input type="submit" value="Odejmij punkty" style="width: 95px;" />
		</form>
		</div>
		
		<form action="/m.r.academy/MasterPage" method="get">
			<input type="submit" value="Wróć do kokpitu" style="width: 200px" />
		</form>
		</div>
	</c:when>
	
	<c:otherwise>
	
		<c:set scope="request" var="studentList"
			value="${requestScope.studentsList}" />
		<c:choose>
			<c:when test="${not empty studentsList}">
				<br />

				<p>Witaj w swoim gabinecie, panie Michale.</p>
				<br />
				<p>Wybierz ucznia...</p>
				<br />
				<form>
					<c:forEach items="${studentsList}" var="x">
						<c:set scope="request" var="levelArray" value="${x.getLevel()}" />
						<c:set scope="request" var="trophyArray"
							value="${x.getTrophy(levelArray[0])}" />

						<button id="students" formmethod="post"
							formaction="/m.r.academy/MasterPage?student=${x.getLogin()}">
							<div style="background-color: #1c8b00">
								<img id="trophies" alt="alt text"
									src="/m.r.academy/img/${trophyArray[0]}.png">
							</div>
							<p>${x.name} ${x.surname}</p>
							<p>Level ${levelArray[0]}</p>
							<p>Points: ${levelArray[1]}/${levelArray[2]}</p>
							<p>${trophyArray[1]}</p>
							<p>${x.studentsClass}</p>
						</button>

					</c:forEach>
				</form>

				<br />
			</c:when>
			<c:when test="${not empty master}">
				<c:redirect url="/MasterPage" />
			</c:when>
		</c:choose>
	</c:otherwise>
</c:choose>
<footer style="clear: both">
	<p>M.R.Academy 2018. All rights reserved.</p>
	<p>Michał Ruciński 2018.</p>
</footer>
</div>
</body>
</html>