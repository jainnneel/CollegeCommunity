package servelt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.askdao;
import entity.message;
import helper.factory;

/**
 * Servlet implementation class deleteAns
 */
public class deleteAns extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteAns() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		
		String id = request.getParameter("aid");
		int aid = Integer.parseInt(id);
		
		askdao a = new askdao(factory.getFactory());
		if(a.deleteAnswer(aid))
		{
		System.out.println("done!!!");
		message msg = new message("Answer deleted successfully","success","alert-danger");
		s.setAttribute("Answerdelete",msg);
		}else{
			message msg = new message("something went wrong","success","alert-danger");
			s.setAttribute("Answerdelete",msg);
		}
}
	

}
