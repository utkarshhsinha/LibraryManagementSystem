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

@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String query = request.getParameter("query");

		// Fetch books from DB
		List<Book> books = BookDAO.searchBook(query);

		// Debugging log
		System.out.println("🔍 Search Query: " + query + " | Books Found: " + books.size());

		// Set books as request attribute
		request.setAttribute("books", books);

		// Forward request back to search.jsp
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}
}