package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class story {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	private user u;
	
	private String name;
	private String path;
	public story() {
		super();
		// TODO Auto-generated constructor stub
	}
	public story(int id, user u, String name, String path) {
		super();
		this.id = id;
		this.u = u;
		this.name = name;
		this.path = path;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public user getU() {
		return u;
	}
	public void setU(user u) {
		this.u = u;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
