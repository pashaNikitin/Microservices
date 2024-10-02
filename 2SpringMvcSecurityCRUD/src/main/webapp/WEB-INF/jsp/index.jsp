
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Главная</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      width: 80%;
      max-width: 600px;
      background-color: #fff;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      text-align: center;
    }
    h3 {
      color: #333;
      margin-bottom: 20px;
    }
    h4 {
      margin: 10px 0;
    }
    a {
      color: #3498db;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    a:hover {
      color: #2980b9;
    }
    .auth-links {
      margin-bottom: 20px;
    }
    .auth-links a {
      margin: 0 10px;
    }
  </style>
</head>
<body>
<div class="container">
  <h3>${pageContext.request.userPrincipal.name}</h3>
  <div class="auth-links">
    <sec:authorize access="!isAuthenticated()">
      <h4><a href="/login">Войти</a></h4>
      <h4><a href="/registration">Зарегистрироваться</a></h4>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <h4><a href="/logout">Выйти</a></h4>
    </sec:authorize>
  </div>
  <sec:authorize access="hasRole('USER')">
    <h4><a href="/user/personal-data">Личные данные (только пользователь)</a></h4>
  </sec:authorize>
  <sec:authorize access="hasRole('ADMIN')">
    <h4><a href="/admin">Пользователи (только админ)</a></h4>
  </sec:authorize>
</div>
</body>
</html>