package servelt;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.askdao;
import entity.askme;
import entity.message;
import helper.factory;

/**
 * Servlet implementation class question
 */
public class question extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public question() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		
		String q = request.getParameter("question");
		String id = request.getParameter("uid");
		int uid = Integer.parseInt(id);
		
		askme a = new askme();
		a.setQuestion(q);
		a.setUid(uid);
		a.setD(new Date());
		
		askdao d = new askdao(factory.getFactory());
		if(d.saveQuestion(a))
		{
		System.out.println("done!!!");
		message msg = new message("Question posted successfully","success","alert-danger");
		s.setAttribute("question",msg);
		response.sendRedirect("profile.jsp");	
		}else{
			message msg = new message("something went wrong","success","alert-danger");
			s.setAttribute("quesion",msg);
			response.sendRedirect("profile.jsp");
		}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
