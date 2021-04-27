package servelt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.message;

/**
 * Servlet implementation class everify
 */
@MultipartConfig
public class everify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public everify() {
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
		HttpSession s=request.getSession();
		int i = (Integer) s.getAttribute("otp");
		PrintWriter out= response.getWriter();
		String var = request.getParameter("vari");
		
		
		int otp = Integer.parseInt(var);
		
		if(i==otp)
		{
			s.removeAttribute("otpMsg");
			out.print("Email Successfully verified Go to login Page");
			response.sendRedirect("middle.jsp");
		}
		else
		{
			message msg = new message("Incorrect Otp","success","alert-danger");
			s.setAttribute("otpMsg",msg);
			/*out.print("Email not verified");*/
			response.sendRedirect("email_verify.jsp");
				
		}
	}

}
