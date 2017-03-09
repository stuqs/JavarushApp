<jsp:useBean id="foundUsers" scope="request" type="java.util.List<net.stuqs.usermanager.model.User>"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="en">
<head>
    <spring:url value="/resources/css/style.css" var="mainCss" />
    <spring:url value="/resources/img/favicon.ico" var="favicon" />
    <link href="${mainCss}" rel="stylesheet" />
    <link href="${favicon}" rel="icon" type="image/ico" />
    <title>Search User</title>
</head>
<body>
<a href="../../index.jsp" style="font-size: 17px">Back to main menu</a>
<br/>
<br/>
<h1>User List</h1>

<%--------------Search user---------------%>
<c:url var="SearchUser" value="/search"/>

<form:form action="${SearchUser}" commandName="user">
    <table id="show" class="simple-little-table" cellspacing='0'>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Search by Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Search Users"/>"/>
            </td>
    </table>
</form:form>
<%-----------------------------------------------------------------------------------%>
<br>
<c:if test="${!empty foundUsers}">
    <table class="simple-little-table" cellspacing='0'>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>IsAdmin</th>
            <th>Created date</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${foundUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                <td>${user.age}</td>
                <td>${user.isAdmin}</td>
                <td>${user.createdDate}</td>
                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${empty foundUsers}">
    <h2>Nothing was Found</h2>
</c:if>
</body>
</html>
