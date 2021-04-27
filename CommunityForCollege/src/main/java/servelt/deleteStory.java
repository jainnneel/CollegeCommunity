package servelt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.storydao;
import helper.factory;

/**
 * Servlet implementation class deleteStory
 */
public class deleteStory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int sid = Integer.parseInt(id);
		storydao d = new storydao(factory.getFactory());
		d.DeleteStory(sid);
		response.sendRedirect("profile.jsp");
	}

}
