package helper;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class profileedit {

	public static boolean delete(String path)
	{
		boolean t =false;
				
				try{
					
					File f =new File(path);
					t=f.delete();
					
				}catch(Exception e){
					e.printStackTrace();
					
				}
				return t;
		
	}
	
	public static boolean save(InputStream is, String path)
	{
		boolean t =false;
		try {
		 byte b[] = new byte[is.available()];
		 is.read(b);
		 
		 FileOutputStream fos = new FileOutputStream(path);
		 fos.write(b);
		 fos.flush();
		 fos.close();
		 t=true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return t;
		
		
	}
	
	
}
