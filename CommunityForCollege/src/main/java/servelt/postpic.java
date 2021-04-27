package servelt;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.message;
import entity.post;
import entity.user;
import helper.factory;
import helper.profileedit;

/**
 * Servlet implementation class postpic
 */
@MultipartConfig
public class postpic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postpic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		Part p1 = request.getPart("pic");
		String name = p1.getSubmittedFileName();
		String pimage = request.getParameter("profile");
		String id = request.getParameter("pid");
		int pid= Integer.parseInt(id);
	
		
		SessionFactory fact= factory.getFactory();
		Session ses = fact.openSession();
		Transaction tx = ses.beginTransaction();
		Query q = ses.createQuery("update post set ptimage=:p where pid=:i");
		q.setParameter("p",name);
		q.setParameter("i", pid);
		q.executeUpdate();
		tx.commit();
		ses.close();
		@SuppressWarnings("deprecation")
		String path=request.getRealPath("/")+"pics"+File.separator+pimage;
 		@SuppressWarnings("deprecation")
		String path1=request.getRealPath("/")+"pics"+File.separator+name;
 		System.out.println(path);
		profileedit.delete(path);
		profileedit.save(p1.getInputStream(),path1);
		response.sendRedirect("profile.jsp");
	}

}
