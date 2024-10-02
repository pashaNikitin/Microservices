<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>User List</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>User List</h1>--%>
<%--<a href="${pageContext.request.contextPath}/admin/add">Add User</a>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Username</th>--%>
<%--        <th>Last Name</th>--%>
<%--        <th>Actions</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="user" items="${allUsers}">--%>
<%--        <tr>--%>
<%--            <td>${user.id}</td>--%>
<%--            <td>${user.username}</td>--%>
<%--            <td>${user.lastName}</td>--%>
<%--            <td>--%>
<%--                <a href="${pageContext.request.contextPath}/admin/edit/${user.id}">Edit</a>--%>
<%--                <a href="${pageContext.request.contextPath}/admin/delete/${user.id}">Delete</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #555;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .add-user-link, .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .add-user-link:hover, .home-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<h1>User List</h1>
<a href="${pageContext.request.contextPath}/admin/add" class="add-user-link">Add User</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Last Name</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${allUsers}">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.lastName}</td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/edit/${user.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/admin/delete/${user.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="${pageContext.request.contextPath}/" class="home-link">Вернуться на главную</a>
</body>
</html>