package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.post;

public class postdao {

	SessionFactory sf;
	public postdao(SessionFactory sf) {
		this.sf=sf;
	}

	public boolean savePost(post p)
	{
		boolean t =false;
		try{
		Session se = sf.openSession();
		Transaction tx = se.beginTransaction();
		se.save(p);
		tx.commit();
		se.close();
		t=true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public int editPost(post p)
	{
		int r=0;
		Session ses = sf.openSession();
	
		try {
			Transaction tx = ses.beginTransaction();
			Query q = ses.createQuery("update post set title=:t,content=:c where pid=:i");
			q.setParameter("t",p.getTitle());
			q.setParameter("c",p.getContent());
			q.setParameter("i",p.getPid());
			r = q.executeUpdate();
			tx.commit();
			ses.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return r;
	}
	
	public int deletePost(int pid)
	{
		int r = 0;
		try {
			Session ses = sf.openSession();
			Query q2;
			Transaction tx = ses.beginTransaction();
			q2=ses.createQuery("delete post where pid=:x");
			q2.setParameter("x",pid);
			r = q2.executeUpdate();
			tx.commit();
			ses.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}
	
	
}
