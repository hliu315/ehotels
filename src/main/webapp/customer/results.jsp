<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Search Results</title>
</head>
<body>
  <h1>Available Rooms</h1>
  <table border="1">
    <tr>
      <th>Room ID</th>
      <th>Price</th>
      <th>Capacity</th>
      <th>Book</th>
    </tr>
    <c:forEach items="${rooms}" var="room">
      <tr>
        <td>${room.room_id}</td>
        <td>$${room.price}</td>
        <td>${room.capacity}</td>
        <td>
          <form action="../book" method="post">
            <input type="hidden" name="room_id" value="${room.room_id}">
            <input type="hidden" name="start_date" value="${param.start_date}">
            <input type="hidden" name="end_date" value="${param.end_date}">
            <input type="submit" value="Book">
          </form>
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>