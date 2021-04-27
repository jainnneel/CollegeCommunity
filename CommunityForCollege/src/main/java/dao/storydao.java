package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.story;
import helper.profileedit;

public class storydao {

	SessionFactory sf;
	public storydao(SessionFactory sf) {
		this.sf= sf;
	}
	
	public void SaveStory(story s){
		try {
			Session ses = sf.openSession();
			Transaction tx = ses.beginTransaction();
			ses.save(s);
			tx.commit();
			ses.close();
		} catch (Exception e) {
			System.out.print(e);
		}
	}
	
	public void DeleteStory(int id){
		try {
			Session ses = sf.openSession();
			Query q1 = ses.createQuery("from story where id=:x");
			q1.setParameter("x",id);
			story s =(story)q1.getSingleResult();
			profileedit.delete(s.getPath());
			Transaction tx = ses.beginTransaction();
			ses.delete(s);
			tx.commit();
			ses.close();
		} catch (Exception e) {
			System.out.print(e);
		}
	}
	
	
}
