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
    <title>User Data</title>
</head>
<body>
<a href="/index.jsp" style="font-size: 17px">Back to main menu</a>
<br/>
<br/>
<h1>User Details</h1>

<%---------------------Edit user---------------------%>
<c:url var="editAction" value="/edit/${user.id}"/>

<form:form action="${editAction}" commandName="user">
    <table class="simple-little-table" cellspacing='0'>
        <tr>
            <td>
                <form:label path="id">
                    <spring:message text="ID"/>
                </form:label>
            </td>
            <td>
                <form:input cssClass="textStyle" path="id" readonly="true" disabled="true"/>
                <form:hidden path="id"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input cssClass="textStyle" path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input cssClass="textStyle" path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isAdmin">
                    <spring:message text="isAdmin"/>
                </form:label>
            </td>
            <td>
                <form:input cssClass="textStyle" path="isAdmin"/>
                <div>1 or true for Admin, 0 or false otherwise</div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Edit User"/>"/>
            </td>
    </table>
</form:form>
<%-----------------------------------------------------------------------------------%>
</body>
</html>