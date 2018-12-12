<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p>
	<spring:message code="complaint.list" />
</p>

<security:authorize access="hasAnyRole('CUSTOMER' , 'REFEREE')">
	<display:table name="complaints" id="complaint" requestURI="${requestURI}" pagesize="5" class="displaytag">
	
		
		<display:column>
		<a href="complaint/edit.do?complaintId=${complaint.id}"><spring:message
		   code="complaint.display"></spring:message></a>
		</display:column>
	
		<spring:message code="complaint.moment" var="complaintName"></spring:message>
		<display:column property="name" title="${complaintName}" sortable="true" />
				
		<display:column>
		<a href="report/display.do?reportId=${comlpaint.report.id}"><spring:message
		   code="complaint.report"></spring:message></a>
		</display:column>
		
		<display:column>
		<a href="complaint/edit.do?complaintId=${complaint.id}"><spring:message
		   code="complaint.display"></spring:message></a>
		</display:column>
		
		<spring:message code="complaint.customer" var="complaintCustomer"></spring:message>
		<display:column property="customer" title="${complaintCustomer}" sortable="true" />
		
		<spring:message code="complaint.referee" var="complaintReferee"></spring:message>
		<display:column property="referee" title="${complaintReferee}" sortable="true" />
		
		<security:authorize access="hasRole('REFEREE')">
		<jstl:if test="${complaint.referee.id != 0}"></jstl:if>
			<a href="complaint/edit.do"><spring:message code="complaint.assign"></spring:message></a>
		</security:authorize>
	
		
	</display:table>
</security:authorize>

<security:authorize access="hasRole('CUSTOMER')">

<a href="application/create.do"><spring:message code="application.create"></spring:message></a>

</security:authorize>