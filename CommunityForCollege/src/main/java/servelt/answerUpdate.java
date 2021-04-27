package servelt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.askdao;
import entity.answer;
import entity.message;
import helper.factory;

@MultipartConfig
public class answerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public answerUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		String ans = request.getParameter("answer");
		String id = request.getParameter("aid");
		int aid = Integer.parseInt(id);
		
		answer a = new answer();
		a.setAns(ans);
		a.setId(aid);
		
		askdao d = new askdao(factory.getFactory());
		int r= d.answerUpdate(a);
		if(r!=0)
		{
			System.out.println("done!!!");
			message msg = new message("Answer Updated successfully","success","alert-danger");
			s.setAttribute("Answerupt",msg);
		}else{
			message msg = new message("something went wrong","success","alert-danger");
			s.setAttribute("Answerupt",msg);
		}


	}

}
