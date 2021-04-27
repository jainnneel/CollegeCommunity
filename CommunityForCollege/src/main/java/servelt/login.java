package servelt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userdao;
import entity.message;
import entity.user;
import helper.factory;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		PrintWriter out =response.getWriter();
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		
		userdao d = new userdao(factory.getFactory());
		user u= d.getUserByEmailandPassword(email, pass);
		System.out.println(email+" "+pass);
				
		if(u.getFname()==null)
		{
			message msg = new message("Incorrect email or password","error","alert-danger");
			s.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
		}
		else
		{
			s.removeAttribute("msg");
			s.setAttribute("user", u);
			out.println("done");
			response.sendRedirect("profile.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
