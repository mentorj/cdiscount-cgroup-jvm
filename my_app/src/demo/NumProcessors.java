package demo;

public class NumProcessors{
  public static void main(String[] args){
    System.out.println("Core seen by this JVM = " + Runtime.getRuntime().availableProcessors());
  }
}
