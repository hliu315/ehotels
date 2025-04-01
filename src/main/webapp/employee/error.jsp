<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
  <title>Error</title>
</head>
<body>
  <h1>Oops! Something went wrong.</h1>
  <p><%= exception.getMessage() %></p>
</body>
</html>