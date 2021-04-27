package servelt;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import dao.storydao;
import entity.story;
import entity.user;
import helper.factory;
@MultipartConfig
public class storySave extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession ses = request.getSession();
	    user u = (user)ses.getAttribute("user");
		PrintWriter p = response.getWriter();
	    String mainPath = request.getRealPath("/")+"pics"+File.separator;
		try {
			ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multifile = sf.parseRequest((RequestContext) request);
			for(FileItem f:multifile){
			f.write(new File(mainPath+f.getName()));
			story s = new story();
			s.setName(f.getName());
			s.setPath(mainPath+f.getName());
			s.setU(u);
			storydao d = new storydao(factory.getFactory());
			d.SaveStory(s);
			}
			response.sendRedirect("profile.jsp");
			p.print("done!!!");
		} catch (Exception e) {
			p.print(e);
		}

	}

}
