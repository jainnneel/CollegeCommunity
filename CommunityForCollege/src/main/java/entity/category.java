package entity;

import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cacheable
@Cache(usage =CacheConcurrencyStrategy.READ_ONLY)
public class category {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cid;
	private String cname;
	
	@OneToMany(mappedBy="c")
	private List<post> p;
	
	public List<post> getP() {
		return p;
	}
	public void setP(List<post> p) {
		this.p = p;
	}
	
	/*@ManyToOne
	private user u;
	
	public user getU() {
		return u;
	}
	public void setU(user u) {
		this.u = u;
	}*/
	public category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public category(int cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
}
