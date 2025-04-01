<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Employee Dashboard</title>
</head>
<body>
  <h1>Convert Booking to Renting</h1>
  <form action="../convert" method="post">
    Booking ID: <input type="number" name="booking_id" required><br>
    <input type="submit" value="Convert">
  </form>
</body>
</html>