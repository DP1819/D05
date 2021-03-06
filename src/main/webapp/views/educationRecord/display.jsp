<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="educationRecord.display" /></p>

<spring:message code="educationRecord.dimplomaTitle"></spring:message>:
<jstl:out value="${educationRecord.diplomaTitle}"></jstl:out>
<br/>

<spring:message code="educationRecord.start"></spring:message>:
<jstl:out value="${educationRecord.start}"></jstl:out>
<br/>

<spring:message code="educationRecord.end"></spring:message>:
<jstl:out value="${educationRecord.end}"></jstl:out>
<br/>

<spring:message code="educationRecord.institution"></spring:message>:
<jstl:out value="${educationRecord.institution}"></jstl:out>
<br/>

<spring:message code="educationRecord.attachment"></spring:message>:
<jstl:out value="${educationRecord.attachment}"></jstl:out>
<br/>

<spring:message code="educationRecord.comments"></spring:message>:
<jstl:out value="${educationRecord.comments}"></jstl:out>
<br/>



<input type="submit" name="edit" value="<spring:message code="educationRecord.edit"></spring:message>" />	
<input type="button" name="cancel" value="${cancel}" onclick="javascript:relativeRedir('educationRecord/display.do')" />	










