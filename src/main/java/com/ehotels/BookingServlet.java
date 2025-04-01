package com.ehotels;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class BookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");

        try (Connection conn = DatabaseConnector.getConnection()) {
            String sql = "INSERT INTO Booking (customer_id, room_id, start_date, end_date) " +
                    "VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, customerId);
            stmt.setInt(2, roomId);
            stmt.setDate(3, Date.valueOf(startDate));
            stmt.setDate(4, Date.valueOf(endDate));
            stmt.executeUpdate();

            response.sendRedirect("customer/booking-success.jsp");

        } catch (SQLException e) {
            throw new ServletException("Booking failed", e);
        }
    }
}