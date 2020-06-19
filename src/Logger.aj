import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public aspect Logger {

    File file = new File("src/log.txt");
    Calendar cal = Calendar.getInstance();
    Date date = cal.getTime();  
    DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");  
    String strDate = dateFormat.format(date);
    
    
    //FileWriter f ;
    
    
    
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    	

    }
    
    pointcut success1() : call(* *.moneyMake*() );
    after() : success1() {
    	
    	System.out.println("Se realizó un depósito" +" "+ strDate);
    	try {
    		PrintWriter f = new PrintWriter(new FileWriter(file, true));
			//f = new FileWriter(file);
			f.println("Se realizó un depósito" +" "+ strDate);
			f.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	
    }
//}


//public aspect Logger {

    pointcut success2() : call(* *.moneyWith*() );
    after() throws IOException : success2() {
    ///Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("Se realizó un retiro"+" "+ strDate);
    	
    	//f = new FileWriter(file);
    	try {
    		PrintWriter f = new PrintWriter(new FileWriter(file, true));
        	f.println("Se realizó un retiro"+" "+ strDate);
        	f.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    }
    
}
