package com.ehotels;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String area = request.getParameter("area");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");

        try (Connection conn = DatabaseConnector.getConnection()) {
            String sql = "SELECT * FROM Room r JOIN Hotel h ON r.hotel_id = h.hotel_id " +
                    "WHERE h.address LIKE ? AND r.available = true";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + area + "%");
            ResultSet rs = stmt.executeQuery();

            request.setAttribute("rooms", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/results.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}