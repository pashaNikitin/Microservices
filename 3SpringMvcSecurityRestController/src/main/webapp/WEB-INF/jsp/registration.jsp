<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
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
      width: 300px;
      background-color: #fff;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      text-align: center;
    }
    h2 {
      color: #333;
      margin-bottom: 20px;
    }
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      color: #333;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }
    .form-group .error {
      color: #e74c3c;
      font-size: 14px;
      margin-top: 5px;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #3498db;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    button:hover {
      background-color: #2980b9;
    }
    a {
      display: block;
      margin-top: 20px;
      color: #3498db;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    a:hover {
      color: #2980b9;
    }
  </style>
</head>

<body>
<div class="container">
  <form:form method="POST" modelAttribute="userForm">
    <h2>Регистрация</h2>
    <div class="form-group">
      <form:input type="text" path="username" placeholder="Username" autofocus="true"></form:input>
      <form:errors path="username" cssClass="error"></form:errors>
      <span class="error">${usernameError}</span>
    </div>
    <div class="form-group">
      <form:input type="password" path="password" placeholder="Password"></form:input>
      <form:errors path="password" cssClass="error"></form:errors>
    </div>
    <div class="form-group">
      <form:input type="password" path="passwordConfirm" placeholder="Confirm your password"></form:input>
      <form:errors path="password" cssClass="error"></form:errors>
      <span class="error">${passwordError}</span>
    </div>
    <button type="submit">Зарегистрироваться</button>
  </form:form>
  <a href="/">Главная</a>
</div>
</body>
</html>