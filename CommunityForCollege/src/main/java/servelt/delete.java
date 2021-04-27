package servelt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.postdao;
import entity.message;

import helper.factory;

public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		String i = request.getParameter("id");
		int pid = Integer.parseInt(i);
		
		postdao pd = new postdao(factory.getFactory());
		int r= pd.deletePost(pid);
		
	
		if(r!=0)
		{
			message msg = new message("Post successfully deleted","Success","alert-success");
			s.setAttribute("msgDelete",msg);
			response.sendRedirect("profile.jsp");
		}
		else {
			message msg = new message("Something went wrong","fail","alert-danger");
			s.setAttribute("msgDelete",msg);
			response.sendRedirect("profile.jsp");
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
