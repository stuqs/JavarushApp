<jsp:useBean id="listUsers" scope="request" type="java.util.List<net.stuqs.usermanager.model.User>"/>
<jsp:useBean id="pages" scope="request" type="java.lang.Integer"/>
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
    <script type="text/javascript">
        function addUser() {
            var lTable = document.getElementById("addUser");
            lTable.style.display = (lTable.style.display == "table") ? "none" : "table";
            document.getElementById("searchUser").style.display = "none";
            document.getElementById("editUser").style.display = "none";
        }
        function editUser() {
            var lTable = document.getElementById("editUser");
            lTable.style.display = (lTable.style.display == "table") ? "none" : "table";
            document.getElementById("searchUser").style.display = "none";
            document.getElementById("addUser").style.display = "none";
        }
        function searchUser() {
            var lTable = document.getElementById("searchUser");
            lTable.style.display = (lTable.style.display == "table") ? "none" : "table";
            document.getElementById("addUser").style.display = "none";
            document.getElementById("editUser").style.display = "none";
        }
    </script>
    <title>Users Page</title>
</head>
<body>
<a href="../../index.jsp" style="font-size: 17px">Back to main menu</a>
<br/>
<br/>
<h1>User List</h1>

<%---------------------Add user---------------------%>
<div class="adduser">
    <a onClick="addUser();" style="font-size: 20px;">Add User</a>
    <a onClick="searchUser();" style="font-size: 20px;padding-left: 20px;">Search User</a>
</div>
<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <table id="addUser" class="simple-little-table" cellspacing='0' style="display: none">
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
                <form:input cssClass="textStyle" path="age" value="18"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isAdmin">
                    <spring:message text="isAdmin"/>
                </form:label>
            </td>
            <td>
                <form:input cssClass="textStyle" path="isAdmin" value="0"/>
                <div style="margin-top: 8px">1 or true for Admin, 0 or false otherwise</div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Add User"/>"/>
            </td>
    </table>
</form:form>
<%-----------------------------------------------------------------------------------%>

<%----------------------Search user---------------------%>

<c:url var="SearchUser" value="/search"/>

<form:form action="${SearchUser}" commandName="user">
    <table id="searchUser" class="simple-little-table" cellspacing='0' style="display: none">
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Search by Name"/>
                </form:label>
            </td>
            <td>
                <form:input cssClass="textStyle" path="name"/>
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
<c:if test="${!empty listUsers}">
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
        <c:forEach items="${listUsers}" var="user">
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
<br><br>
    <div class="adduser">
        <c:forEach var="i" begin="1" end="${pages}">
            <a style="font-size: 27px" href="/users/${i}">${i}&emsp;</a>
        </c:forEach>
    </div>
</c:if>
</body>
</html>
