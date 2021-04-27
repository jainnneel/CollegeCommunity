package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.answer;
import entity.askme;

public class askdao {

	SessionFactory sf;
	public askdao(SessionFactory sf) {
	
		this.sf=sf;
	}

	public boolean saveQuestion(askme q)
	{
		boolean t= false;
		try {
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			s.save(q);
			tx.commit();
			s.close();
			t=true;
		} catch (Exception e) {
				e.printStackTrace();
		}
		return t;
	}
	
	public boolean saveAnswer(answer a)
	{
		boolean t= false;
		try {
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			s.save(a);
			tx.commit();
			s.close();
			t=true;
		} catch (Exception e) {
				e.printStackTrace();
		}
		return t;
	}
	
	public boolean deleteAnswer(int id)
	{
		boolean t= false;
		try {
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			Query q = s.createQuery("delete answer  where id=:x");
			q.setParameter("x",id);
			q.executeUpdate();
			tx.commit();
			s.close();
		} catch (Exception e) {
				e.printStackTrace();
		}
		return t;
		
	}
	public int answerUpdate(answer a)
	{
		int i=0;
		try {
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			Query q = s.createQuery("update answer set ans=:x where id=:y");
			q.setParameter("x",a.getAns());
			q.setParameter("y",a.getId());
			q.executeUpdate();
			tx.commit();
			s.close();
			i=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
		
	}
	
	
}
