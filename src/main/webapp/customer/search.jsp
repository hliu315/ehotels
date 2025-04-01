<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Search Rooms</title>
</head>
<body>
  <h1>Search Rooms</h1>
  <form action="../search" method="post">
    Area: <input type="text" name="area" required><br>
    Start Date: <input type="date" name="start_date" required><br>
    End Date: <input type="date" name="end_date" required><br>
    <input type="submit" value="Search">
  </form>
</body>
</html>