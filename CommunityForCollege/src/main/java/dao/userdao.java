package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.user;

public class userdao {

	SessionFactory sf;
	public userdao(SessionFactory sf) {
		this.sf=sf;
	}

	public boolean saveUser(user u)
	{
		boolean t=false;
		try {
			Session se = sf.openSession();
			Transaction tx = se.beginTransaction();
			se.save(u);
			tx.commit();
			se.close();
			t=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return t;
	}
	
	public user getUserByEmailandPassword(String email,String pass)
	{
		user u = new user();
		Session se = sf.openSession();
		try{
		String q="from user where email=:x and pass=:y";

		Query qs =se.createQuery(q);
		qs.setParameter("x",email);
		qs.setParameter("y",pass);
		List<user> l= qs.list();
		
		for(user u1:l)
		{
			u.setId(u1.getId());
			u.setFname(u1.getFname());
			u.setCity(u1.getCity());
			u.setDob(u1.getDob());
			u.setLname(u1.getLname());
			u.setEmail(email);
			u.setGender(u1.getGender());
			u.setPass(pass);
			u.setUname(u1.getUname());
			u.setState(u1.getState());
			u.setBio(u1.getBio());
			u.setProfile(u1.getProfile());
			u.setCategory(u1.getCategory());
		}
	
		se.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public int editProfile(user u)
	{
		int r = 0;
		Session se =sf.openSession();
	   try{
			Transaction tx = se.beginTransaction();
			Query q = se.createQuery("update user set fname=:f,bio=:b,pass=:ps where email=:e");
		    
		    q.setParameter("f",u.getFname());
		    q.setParameter("b",u.getBio());
		    q.setParameter("ps",u.getPass());
		    q.setParameter("e",u.getEmail()); 
		    r = q.executeUpdate();
		    tx.commit();
			se.close();
		}catch (Exception e) {
		   e.printStackTrace();
		   // TODO: handle exception
	}
	
	   return r;
	}
	
	
	

}

