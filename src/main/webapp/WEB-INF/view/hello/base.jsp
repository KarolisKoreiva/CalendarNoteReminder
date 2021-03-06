<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<link href="<c:url value="/resources/css/picker.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<title><spring:message code="message.title" /></title>
</head>
<body>
	<c:if test="${empty user}">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">User log in failed</h3>
						</div>
						<fieldset>

							<!-- Change this to a button or input when using this as a form -->
							<a href="http://localhost:8080/" type="submit"
								class="btn btn-success btn-block">Try to log in once again</a>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty user}">
		<c:if test="${not empty user}">
			<article>
				<h1>
					<spring:message code="message.welcome" />
				</h1>

				<p class="subtitle fancy">
					<span> <c:if test="${not empty user.login}">
		    			${user.login}
		    		</c:if>
					</span>
				</p>
			</article>
		</c:if>
		<article>
		<ul>
			<c:forEach items="${user.getReminders()}" var="reminder" varStatus="count">
					<li>${reminder} <input id="${count.index}" class="remove" type="submit" value="remove"></li>
			</c:forEach>
		</ul>
		</article>
		
		<article>
			<form:form method="POST" action="base">
				<label>Pick a reminder date and time: </label>
				<input type="text" id="input" name="reminderDate">
				<div class="js-mini-picker-container"></div>
				<label>Enter note for reminder: </label>
				<input type="text" id="note" name="reminderNote">
				<br>
				<input type="submit" name="submit" value="Add reminder">			
			</form:form>
		</article>
		
	</c:if>
	<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/picker.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script type="text/javascript"> window.onload = alertName; </script>
	
</body>
</html>