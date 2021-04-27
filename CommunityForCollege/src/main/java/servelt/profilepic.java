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

import entity.user;
import helper.factory;
import helper.profileedit;

/**
 * Servlet implementation class profilepic
 */
@MultipartConfig
public class profilepic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profilepic() {
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
		Part p = request.getPart("profile");
		String name1=p.getSubmittedFileName();
		HttpSession s = request.getSession();
		
		user u=(user)s.getAttribute("user");
		String profile = u.getProfile();
		u.setProfile(name1);
		
		 SessionFactory sf = factory.getFactory();
		    Session se =sf.openSession();
		    Transaction tx = se.beginTransaction();
		    Query q = se.createQuery("update user set profile=:p where email=:e");
		    q.setParameter("p",name1);	
		    q.setParameter("e",u.getEmail()); 
		    q.executeUpdate();
		    tx.commit();
		    se.close();
	     	@SuppressWarnings("deprecation")
			String path=request.getRealPath("/")+"pics"+File.separator+profile;
	 		@SuppressWarnings("deprecation")
			String path1=request.getRealPath("/")+"pics"+File.separator+name1;
	 		System.out.println(path);
			profileedit.delete(path);
			profileedit.save(p.getInputStream(),path1);
			response.sendRedirect("profile.jsp");
	}
	

}
