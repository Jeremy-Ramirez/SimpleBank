public aspect Log {

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
}
