package servelt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userdao;
import entity.user;
import helper.factory;

/**
 * Servlet implementation class datasend
 */
@MultipartConfig
public class datasend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public datasend() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter o = response.getWriter();
		HttpSession s=request.getSession();
		String fname=(String) s.getAttribute("fname");
		String lname=(String) s.getAttribute("lname");
		String uname=(String) s.getAttribute("uname");
		String email=(String) s.getAttribute("email");
		String date=(String) s.getAttribute("date");
		String city=(String) s.getAttribute("city");
		String pass=(String) s.getAttribute("pass");
		String sex=(String) s.getAttribute("sex");
		String state=(String) s.getAttribute("state");
		String category=(String) s.getAttribute("category");
		String department=(String) s.getAttribute("department");
		
		
		/*ArrayList<String> cat = (ArrayList<String>) s.getAttribute("category");
		List<category> c = new ArrayList<category>();
		
		category c1 =new category();
		category c2 =new category();
		category c3 =new category();
		category c4 =new category();
		category c5 =new category();
		
		c1.setCname(cat.get(1));
		c2.setCname(cat.get(2));
		c3.setCname(cat.get(3));
		c4.setCname(cat.get(4));
		c5.setCname(cat.get(5));
		
		c.add(c1);
		c.add(c2);
		c.add(c3);
		c.add(c4);
		c.add(c5);*/
		
			
		user u = new user();
		
		u.setFname(fname);
		u.setCity(city);
		u.setDob(date);
		u.setLname(lname);
		u.setEmail(email);
		u.setGender(sex);
		u.setPass(pass);
		u.setUname(uname);
		u.setState(state);
		u.setCategory(category);
		u.setDepartment(department);
	
		userdao d = new userdao(factory.getFactory());
		d.saveUser(u);
	
		
		if(d.saveUser(u) != false)
		{
			o.println("You Successfuly registered..We are redirecting you to login page..");
		}
		else
		{   
			o.println("try again");
			System.out.println("not done??");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
