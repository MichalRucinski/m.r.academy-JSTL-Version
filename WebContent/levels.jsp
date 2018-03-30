<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="java.util.ArrayList, database.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:import url="header.jsp" charEncoding="UTF-8"/>

		<div id="levelsBody">
		<br />
		<p style="text-align: center">***</p>
		<article>
			<p>W mojej muzycznej akademii - M.R.Academy - uczniowie mają przypisane poziomy ich zaawansowania (tzw. "Levele") 
			w grze na danym instrumencie. Poziomy te uszeregowane są od 1 do 100, gdzie pierwszy to poziom ucznia
			absolutnie początkującego, a 100 to ostatni poziom uczniowski, po którym następują poziomy profesjonalne
			 - nieujęte w moim systemie nauczania (levele 101-200). Ostatni - setny poziom uczniowski odpowiada mniej więcej 
			 poziomowi zdolnych absolwentów szkół muzycznych I stopnia, lub uczniów pierwszych, drugich klas szkoły muzycznej 
			 II stopnia.
			 </p>
			 <p>Aby bliżej to zilustrować nieobeznanemu czytelnikowi, podaję kilka przykładów jak grać może uczeń na 
			 różnych poziomach zaawansowania:
			 </p>
			 <br/>
			 <div id="levelsChoose">
			 <a id="levelsInstruments" href="/m.r.academy/Levels?instrument=piano">Piano and keyboard</a><a id="levelsInstruments" href="/m.r.academy/Levels?instrument=guitar">Guitar</a>
			 </div>
			 <br/>
			 <c:if test="${not empty instrument}">
	
			 <p style="text-align: center">Poziomy</p>
			 <br/>
			 <div id="levelsChoose2">
			 <a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=10">10</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=20">20</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=30">30</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=40">40</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=50">50</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=60">60</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=70">70</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=80">80</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=90">90</a><a id="levels" href="/m.r.academy/Levels?instrument=${instrument}&level=100">100</a>
			 </div>
			 
			 <br/>
			 </c:if>
			 
			 <c:if test="${not empty level}">
			 <sql:setDataSource var="ds" dataSource="jdbc/m1304_mracademy"/>
			 <sql:query dataSource="${ds}" var="results" sql="select * from levels where instrument=? and level=?">
			 <sql:param>${instrument}</sql:param>
			 <sql:param>${level}</sql:param>
			 </sql:query>
			 <c:set scope="page" var="levelDescription" value="${results.rows[0]}"/>
			 <p style="text-align: center">Level ${levelDescription.level}:</p>
			 <br/>
			 <div class="trophyLevels">
			 <img class="trophyLevels" src="/m.r.academy/img/${levelDescription.level}.png">
			 </div>
			 <br/>
			 <br/>
			 <p>${levelDescription.text}</p>
			 <br/>
			 <br/>
			 ${levelDescription.link}
			 <br/>
			 <br/>
			 </c:if>

		</article>
		<br/>
		</div>
		<div id="imagesfrontpage">
			<img id="piano" src="piano.jpg" alt="PIANO" /><img id="guitar"
				src="gitara.jpg" alt="GUITAR" /><img id="notes" src="notes.jpg"
				alt="SHEETMUSIC" />
		</div>
		<br />
				
<c:import url="footer.jsp" charEncoding="UTF-8"/>
