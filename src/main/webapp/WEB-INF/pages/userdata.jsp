<jsp:useBean id="user" scope="request" type="net.stuqs.usermanager.model.User"/>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="en">
<head>
    <spring:url value="/resources/css/style.css" var="mainCss" />
    <spring:url value="/resources/img/favicon.ico" var="favicon" />
    <link href="${mainCss}" rel="stylesheet" />
    <link href="${favicon}" rel="icon" type="image/ico" />
    <title>User Data</title>
</head>
<body>
<h1>User Details</h1>

<table class="simple-little-table" cellspacing='0'>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>IsAdmin</th>
        <th>Created date</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.isAdmin}</td>
        <td>${user.createdDate}</td>
    </tr>
</table>
</body>
</html>