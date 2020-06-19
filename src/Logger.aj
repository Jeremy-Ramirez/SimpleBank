import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    
    	
    
    pointcut success1() : call(* *.moneyMake*() );
    after() : success1() {
    	
    	System.out.println("Se realiz� un dep�sito");
    	
    }
    pointcut success2() : call(* *.moneyWith*() );
    after() : success2() {
    ///Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("Se realiz� un retiro");
    	
    }
}
