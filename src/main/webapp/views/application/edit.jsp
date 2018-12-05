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
	<spring:message code="category.edit" />
</p>

<!--  Primero pongo la autoridad ya que solo un admin maneja las categorias -->
<security:authorize access="hasRole('CUSTOMER' || 'HANDYWORKER')">

	<div>
		<form:form action="category/administrator/edit.do" method="post" id="formCreate"
			name="formCreate" modelAttribute="category" onsubmit="fechas()"></form:form>

	<!-- No me acuerdo exactamente para que hacia falta  -->
			<form:hidden path="id" />
			<form:hidden path="version" />
			<form:hidden path="customer" />

<!-- los atributos -->
			<form:label path="price"> <spring:message code="application.price" /></form:label>
			<form:input path="price" /><form:errors cssClass="error" path="price" /><br />
			
			<form:label path="moment"> <spring:message code="application.moment" /></form:label>
			<form:input path="moment" /><form:errors cssClass="error" path="moment" /><br />
			
		<!-- Status ------------------->
		<!-- TODO: -->
			
		<form:label path="status"><spring:message code="application.status"></spring:message></form:label>
		<form:select id="status" path="status">
		<form:option value="${STATUS}" label="PENDING"></form:option>
		<form:options items="${status}" itemLabel="name" itemValue="id" />
		</form:select>
		<form:errors cssClass="error" path="status" />


		
			<!-- ---------------------- -->
			
			<form:label path="workerMoments"> <spring:message code="application.workerMoments" /></form:label>
			<form:input path="workerMoments" /><form:errors cssClass="error" path="workerMoments" /><br />
			
			<form:label path="customerMoments"> <spring:message code="application.customerMoments" /></form:label>
			<form:input path="customerMoments" /><form:errors cssClass="error" path="customerMoments" /><br />
			
			<form:label path="creditCard"> <spring:message code="application.creditCard" /></form:label>
			<form:input path="creditCard" /><form:errors cssClass="error" path="creditCard" /><br />
			
			<form:label path="handyWorker"> <spring:message code="application.handyWorker" /></form:label>
			<form:input path="handyWorker" /><form:errors cssClass="error" path="handyWorker" /><br />
		

	</div>
	<!--  Los botones de crear y cancelar -->

		<input type="submit" name="save" value="<spring:message code="application.save"></spring:message>" />	
		<input type="button" name="cancel" value="${cancel}" onclick="javascript:relativeRedir('application/list.do')" />	

</security:authorize>

