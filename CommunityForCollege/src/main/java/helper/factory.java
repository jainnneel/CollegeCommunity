package helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class factory {

	public static SessionFactory sf;
	
	public static SessionFactory getFactory()
	{
		
		if(sf==null)
		{
		Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        sf = cfg.buildSessionFactory();
		}
        return sf;
		
	}
	
	public static void closeFactory()
	{
		
		if(sf.isOpen())
		{
			sf.close();
		}
        
	}
	
	
}
