package helper;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import entity.liked;


public class forlike {

	public boolean isliked(int uid,int pid)
	{
		boolean t=false;
	try{	
		SessionFactory sf = factory.getFactory();
		Session s = sf.openSession();
		liked l = new liked();
		
		/*post p = new post();
		List<liked> l1 = new ArrayList<liked>();
		l1.add(l);
		
		p.setL(l1);
		user u = new user();
		u.setL(l1);
		*/
		l.setPt(pid);
		l.setUr(uid);
		Transaction tx = s.beginTransaction();
		
		s.save(l);
		tx.commit();
		s.close();
		t=true;
	}catch (Exception e) {
				e.printStackTrace();
		}
		return t;
		
		
	}
	

	public int countLike(int pid)
	{
		int t=0;
	try{	
		SessionFactory sf = factory.getFactory();
		Session s = sf.openSession();
		 
		Query q= s.createQuery("from liked where pt=:x");
		
		q.setParameter("x",pid);

		List<liked> l = q.list();
		
		for(liked l1:l)
		{
			t++;
		}
		s.close();
		
	}catch (Exception e) {
				e.printStackTrace();
				System.out.print("not don!!!!");
		}
		return t;
		
		
	}
	public int unliked(int uid,int pid)
	{
		int t=0;
	try{	
		SessionFactory sf = factory.getFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		Query q3 = s.createQuery("delete from liked where pt=:x and ur=:y");
		q3.setParameter("x",pid);
		q3.setParameter("y",uid);
		
		t=q3.executeUpdate();
		tx.commit();
		s.close();
		System.out.print(" don!!!!");
		
	}catch (Exception e) {
				e.printStackTrace();
				System.out.print("not don!!!!");
		}
		return t;
		
		
	}
	
}
