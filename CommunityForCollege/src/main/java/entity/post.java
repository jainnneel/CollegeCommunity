package entity;

import java.util.Date;
import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


@Entity
@Cacheable
@Cache(usage =CacheConcurrencyStrategy.READ_ONLY)
public class post {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pid;
	private String title;
	private String content;
	private String thimage;
	private String ptimage;
	private Date d;
	
	@ManyToOne
	private user u;
	
	public user getU() {
		return u;
	}
	public void setU(user u) {
		this.u = u;
	}
	
	public Date getD() {
		return d;
	}
	public void setD(Date d) {
		this.d = d;
	}

	@ManyToOne
	private category c;
	public category getC() {
		return c;
	}
	public void setC(category c) {
		this.c = c;
	}
	
	/*@OneToMany(mappedBy = "pt")
	private List<liked> l;
	
	public List<liked> getL() {
		return l;
	}
	public void setL(List<liked> l) {
		this.l = l;
	}
	*/
	
	public post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public post(int pid, String title, String content, String thimage, String ptimage) {
		super();
		this.pid = pid;
		this.title = title;
		this.content = content;
		this.thimage = thimage;
		this.ptimage = ptimage;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThimage() {
		return thimage;
	}
	public void setThimage(String thimage) {
		this.thimage = thimage;
	}
	public String getPtimage() {
		return ptimage;
	}
	public void setPtimage(String ptimage) {
		this.ptimage = ptimage;
	}
	
	
}
