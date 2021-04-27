package servelt;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.postdao;
import entity.message;
import entity.post;
import helper.factory;

@MultipartConfig
public class editPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public editPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		int r = 0;
	
		try{
			
			String id = request.getParameter("pid");
			int pid= Integer.parseInt(id);
			String title = request.getParameter("title");
			String content = request.getParameter("content");
		
			post p = new post();
			p.setPid(pid);
			p.setTitle(title);
			p.setContent(content);
			
			postdao pd = new postdao(factory.getFactory());
			r=pd.editPost(p);
			
			if(r!=0)
			{
			message msg = new message("Post successfully updated","Success","alert-success");
			s.setAttribute("msgPostedit",msg);
			response.sendRedirect("profile.jsp");
			}
			else {
				message msg = new message("Something went wrong","fail","alert-danger");
				s.setAttribute("msgPostedit",msg);
				response.sendRedirect("profile.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			
		}
			
	}			

}
