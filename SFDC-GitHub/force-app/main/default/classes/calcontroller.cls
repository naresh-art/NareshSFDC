public class calcontroller {

   public decimal firstNumber{set;get;}
   public decimal secondNumber{set;get;}
   public decimal result{set;get;}
   
   public void sum()
   {
       result = firstNumber + secondNumber;
   }
   public void sub()
   {
       result = firstNumber - secondNumber;
   }
   public void mul()
   {
       result = firstNumber * secondNumber;
   }
}