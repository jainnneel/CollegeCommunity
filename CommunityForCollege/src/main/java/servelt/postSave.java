package servelt;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.postdao;
import entity.category;
import entity.message;
import entity.post;
import entity.user;
import helper.factory;
import helper.profileedit;

/**
 * Servlet implementation class postSave
 */
@MultipartConfig
public class postSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession s = request.getSession();
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Part fp = request.getPart("fimage");
		Part pp =request.getPart("pimage");
		String fpath=fp.getSubmittedFileName();
		String ppath=pp.getSubmittedFileName();
		int cid=Integer.parseInt(request.getParameter("cname"));
		
		
		user u=(user)s.getAttribute("user");
		
		category c = new category();
		
		c.setCid(cid);
		System.out.println(cid);
		
		post p = new post();
		
		p.setTitle(title);
		p.setContent(content);
		p.setThimage(fpath);
		p.setPtimage(ppath);
		p.setU(u);
		p.setC(c);
		p.setD(new Date());
		
		List<post> l =new ArrayList<post>();
		l.add(p);
		u.setP(l);
		c.setP(l);
		
		postdao pd = new postdao(factory.getFactory());
		boolean t=  pd.savePost(p);
		
	
		@SuppressWarnings("deprecation")
		String fpath1=request.getRealPath("/")+"pics"+File.separator+fpath;
		@SuppressWarnings("deprecation")
		String ppath1=request.getRealPath("/")+"pics"+File.separator+ppath;
		

		if(profileedit.save(fp.getInputStream(),fpath1) && profileedit.save(pp.getInputStream(),ppath1) && t)
		{
			message msg = new message("Successfully Posted","success","alert-success");
			s.setAttribute("postMsg",msg);
			response.sendRedirect("profile.jsp");
		}
		else
		{
			message msg = new message("Somethigs went wrong","fail","alert-danger");
			s.setAttribute("postMsg",msg);
			response.sendRedirect("profile.jsp");	
			
		}
	}

}
