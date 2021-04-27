package filters;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import entity.message;
import entity.user;
import helper.factory;

/**
 * Servlet Filter implementation class uniqueEmail
 */
public class uniqueEmail implements Filter {

    /**
     * Default constructor. 
     */
    public uniqueEmail() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession  s = req.getSession();
		String email = req.getParameter("email");
		
		SessionFactory fact= factory.getFactory();
		Session ses = fact.openSession();
		
		Query q = ses.createQuery("from user where email=:x");
		q.setParameter("x",email);
		List<user> l = q.list();
		
		System.out.println(l.size()+":size");
		
		if(l.size()!=0)
		{
			message m = new message("email already registered","fail","alert-danger");
			s.setAttribute("emailver",m);
			res.sendRedirect("signup.jsp");
		}
		else
		{
		chain.doFilter(request, response);
		}
		}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
