package entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class answer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String ans;
	private int uid;
	private Date d;
	
	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}

	@ManyToOne
	private askme q;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}



	public askme getQ() {
		return q;
	}

	public void setQ(askme q) {
		this.q = q;
	}

	public answer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public answer(int id, String ans, askme a) {
		super();
		this.id = id;
		this.ans = ans;
		this.q = a;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
