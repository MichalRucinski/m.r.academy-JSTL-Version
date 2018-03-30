<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, database.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp" charEncoding="UTF-8" />

<div id="leftdiv">
	<a class="chooseclass" href="/m.r.academy/MusicSchool?action=piano">PIANINO</a>
	<a class="chooseclass" href="/m.r.academy/MusicSchool?action=keyboard">KEYBOARD</a>
	<a class="chooseclass" href="/m.r.academy/MusicSchool?action=guitar">GITARA</a>
</div><div id="rightdiv">
	<a class="chooseclass"
		href="/m.r.academy/MusicSchool?action=pianoandkeyboard">PIANINO I KEYBOARD</a> <a class="chooseclass"
		href="/m.r.academy/MusicSchool?action=all">WSZYSTKIE KLASY</a>
</div>

<c:if test="${not empty list}">

	<div id="class">
		<p>${inscription}</p>
	</div>

	<div id="studentsAll">
		<c:forEach items="${list}" var="x">

			<c:set scope="request" var="levelArray" value="${x.getLevel()}" />
			<c:set scope="request" var="trophyArray" value="${x.getTrophy(levelArray[0])}" />

			<div id="students">
				<div style="background-color: #1c8b00">
					<img id="trophies" alt="alt text" src="/m.r.academy/img/${trophyArray[0]}.png">
				</div>
				<p>${x.name} ${x.surname}</p>
				<p>Level ${levelArray[0]}</p>
				<p>To next level:</p>
				<p>${levelArray[2] - levelArray[1]}p.</p>
				<p>${trophyArray[1]}</p>
				<p>${x.studentsClass}</p>
			</div>

		</c:forEach>
	</div>


</c:if>

<img id="piano" src="piano.jpg" alt="PIANO" /><img id="guitar" src="gitara.jpg"
	 alt="GUITAR" /><img id="notes" src="notes.jpg" alt="SHEETMUSIC" />

<br />

<c:import url="footer.jsp" charEncoding="UTF-8" />
