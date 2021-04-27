package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity

public class liked {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int lid;

	private int pt;
	
	private int ur;

	public liked() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getPt() {
		return pt;
	}

	public void setPt(int pt) {
		this.pt = pt;
	}

	public int getUr() {
		return ur;
	}

	public void setUr(int ur) {
		this.ur = ur;
	}

	public liked(int lid, int pt, int ur) {
		super();
		this.lid = lid;
		this.pt = pt;
		this.ur = ur;
	}
	

/*	@ManyToOne(cascade=CascadeType.ALL)
	private post pt;
	
	@ManyToOne(cascade=CascadeType.ALL)
	private user ur;
*/
	
	

	
}
