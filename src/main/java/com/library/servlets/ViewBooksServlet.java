package com.library.servlets;

import com.library.dao.BookDAO;
import com.library.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewBooks")
public class ViewBooksServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetch all books from the database
		List<Book> books = BookDAO.getAllBooks();

		// Debugging logs to check if books are fetched
		System.out.println("📌 ViewBooksServlet: Books fetched = " + books.size());

		// Forward books list to the JSP page
		request.setAttribute("books", books);
		request.getRequestDispatcher("books.jsp").forward(request, response);
	}
}