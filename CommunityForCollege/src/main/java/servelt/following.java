package servelt;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.followdao;
import entity.follow;
import helper.factory;

/**
 * Servlet implementation class following
 */
public class following extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public following() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int luid = Integer.parseInt(request.getParameter("lid"));
		int puid = Integer.parseInt(request.getParameter("uid"));
		System.out.println("wsdf"+luid);
		
		PrintWriter p = response.getWriter();
		
		follow f = new follow();
		f.setUserid(luid);
		f.setFollow(puid);
       
		followdao fd = new followdao(factory.getFactory());
		int size=fd.dofollow(f);
		
		p.print(size);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
