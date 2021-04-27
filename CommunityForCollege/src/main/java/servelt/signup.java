package servelt;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helper.email;

/**
 * Servlet implementation class signup
 */
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname= request.getParameter("fname");
		String lastname= request.getParameter("lname");
		String username= request.getParameter("uname");
		String email= request.getParameter("email");
		String date= request.getParameter("date");
		String city= request.getParameter("city");
		String state= request.getParameter("state");
		String pass= request.getParameter("pass");
		String gender = request.getParameter("sex");
		String s1[]=request.getParameterValues("category");
		String depart = request.getParameter("department");
		
		String b="";

		if(s1!=null)
		{
		for(int i=0;i<s1.length;i++)
		{
		b=s1[i]+","+b;	
		}
		}
		
		HttpSession s=request.getSession();
		s.setAttribute("fname",firstname);
		s.setAttribute("lname",lastname);
		s.setAttribute("uname",username);
		s.setAttribute("email",email);
		s.setAttribute("date",date);
		s.setAttribute("city",city);
		s.setAttribute("state",state);
		s.setAttribute("pass",pass);
		s.setAttribute("sex",gender);
		s.setAttribute("category",b);
		s.setAttribute("department",depart);
		
		
		Random o= new Random();
		int op = o.nextInt(100);
		int otp = 100+op+852+op;
		s.setAttribute("otp",otp);
		System.out.println("done "+otp);
		String receiverEmailID = email;
		String emailSubject = "Account verification";
		String emailBody = "your otp for registration:"+otp+".";
		email d =new email();
		d.SendEmail(receiverEmailID,emailSubject,emailBody);
		System.out.println("done "+otp);
		response.sendRedirect("email_verify.jsp");
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
