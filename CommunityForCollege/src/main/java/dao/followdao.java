package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import entity.follow;
import entity.post;

public class followdao {

	SessionFactory sf;
	public followdao(SessionFactory sf) {
		this.sf=sf;
	}
	
	public int dofollow(follow f)
	{
		int t = 0;
		try {
			Session ses = sf.openSession();
			Transaction tx = ses.beginTransaction();
			ses.save(f);
			tx.commit();
			org.hibernate.query.Query q7 = ses.createQuery("from follow where follow=:x");
			q7.setParameter("x",f.getFollow());
			List<post> fg = q7.list();
			t= fg.size();
			ses.close();
			System.out.println("done@!@");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public int dounfollow(int luid,int puid)
	{
		int r=0;
		try {
			Session ses = sf.openSession();
			Transaction tx = ses.beginTransaction();
			Query q3 = ses.createQuery("delete from follow where follow=:x and userid=:y");
			q3.setParameter("x",puid);
			q3.setParameter("y",luid);
			r= q3.executeUpdate();
			System.out.println(r);
			tx.commit();
			Query q7 = ses.createQuery("from follow where follow=:x");
			q7.setParameter("x",puid);
			List<post> fg = q7.list();
			ses.close();
			r=fg.size();
			System.out.println("done@!@");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
		
		
	}
}

