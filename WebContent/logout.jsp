<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" import="beans.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${user != null || user.isLoggedIn()}">
${user.setLoggedIn(false)}
</c:if>

<c:import url="header.jsp" charEncoding="UTF-8"/>
		
<br/>
<article>

<p>Żegnaj, ${user.getName()}. Wylogowano Cię !</p>

</article>
<br/>
<div id="imagesfrontpage">
<img id="piano" src="piano.jpg" alt="PIANO"/><img id="guitar" src="gitara.jpg" alt="GUITAR"/><img id="notes" src="notes.jpg" alt="SHEETMUSIC"/>
</div>
<br/>

		
<c:import url="footer.jsp" charEncoding="UTF-8"/>