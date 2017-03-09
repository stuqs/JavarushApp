<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="en">
<head>
    <spring:url value="/resources/css/style.css" var="mainCss" />
    <spring:url value="/resources/img/favicon.ico" var="favicon" />
    <link href="${mainCss}" rel="stylesheet" />
    <link href="${favicon}" rel="icon" type="image/ico" />
    <title>Main Page</title>
</head>
<body>
<h1><a href="<c:url value="/users/1"/>" target="_blank" style="font-size: 30px">List of Users</a></h1>
</body>
</html>
