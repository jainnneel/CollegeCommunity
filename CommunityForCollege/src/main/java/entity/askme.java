package entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class askme {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int uid;
	private Date d;
	
	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	private String question;
	
	@OneToMany(mappedBy="q",cascade= CascadeType.ALL)
	private List<answer> a;

	public askme() {
		super();
		// TODO Auto-generated constructor stub
	}

	public askme(int id, String question, List<answer> a) {
		super();
		this.id = id;
		this.question = question;
		this.a = a;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public List<answer> getA() {
		return a;
	}

	public void setA(List<answer> a) {
		this.a = a;
	}
	
	
}
