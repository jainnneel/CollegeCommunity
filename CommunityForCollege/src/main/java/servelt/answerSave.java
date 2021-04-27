package servelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import dao.askdao;
import entity.answer;
import entity.askme;
import entity.message;
import helper.factory;

/**
 * Servlet implementation class answerSave
 */
@MultipartConfig
public class answerSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public answerSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		SessionFactory fact= factory.getFactory();
		Session ses = fact.openSession();
		PrintWriter p = response.getWriter();
		String ans = request.getParameter("answer");
		String id = request.getParameter("uid");
		int uid = Integer.parseInt(id);
		String idq = request.getParameter("qid");
		int qid = Integer.parseInt(idq);
		
		Query qs=ses.createQuery("from askme where id=:x");
		qs.setParameter("x",qid);
		askme q =  (askme) qs.getSingleResult();
		
		answer a = new answer();
		a.setAns(ans);
		a.setQ(q);
		a.setUid(uid);
		a.setD(new Date());
		
		askdao d = new askdao(factory.getFactory());
		if(d.saveAnswer(a))
		{
		System.out.println("done!!!");
		message msg = new message("Answer posted successfully","success","alert-danger");
		s.setAttribute("Answer",msg);
		}else{
			message msg = new message("something went wrong","success","alert-danger");
			s.setAttribute("Answer",msg);
		}

		
	}

}
