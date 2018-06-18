<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
	<link href="<c:url value="/resources/css/Picker.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
	
    <title><spring:message code="message.title" /></title>
</head>
<body>
	<c:if test="${not empty user}">
		<article>
			<h1><spring:message code="message.welcome" /></h1>
			
			<p class="subtitle fancy">
		    	<span>
		    		<c:if test="${not empty user.login}">
		    			${user.login}
		    		</c:if>
		    	</span>
		    </p>
		</article>
	</c:if>
	
	<article>
		<form:form method="POST" action="base">
			<label>Pick a reminder date and time: </label>
			<input type="text" id="input" name="reminderDate">
			<div class="js-mini-picker-container"></div>
			<input type="submit" name="submit">
		</form:form>
	</article>
	
	<article>	
	    <h1><spring:message code="message.language_example" /></h1>
	
	    <p class="subtitle fancy">
	    	<span>
	    		<spring:message code="message.language" /> : 
	    		<a href="?lang=en"><spring:message code="message.english" /></a> | 
	    		<a href="?lang=lt"><spring:message code="message.lithuanian" /></a>
	    	</span>
	    </p>
	
	    <p><spring:message code="message.hello" /></p>
	    
	    <p>
	    	<spring:message code="message.time_now" /> : <fmt:formatDate type = "both" value = "${now}" />
	    </p>
	</article>
	<article>
		<h1><spring:message code="message.operating_system" /></h1>
		
		<p class="subtitle fancy">
	    	<span>${operatingSystem}</span>
	    </p>
	    
	    <p><spring:message code="message.java_version" />
	    	<span>${javaVersion}</span>
	    </p>
	</article>
	
	<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/Picker.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
</body>
</html>