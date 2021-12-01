public class IndividualProperties {
    public decimal firstNumber{set;get;}
    public decimal secondNumber{set;get;}
    public decimal Result{set;get;}
    public void sum()
    {
        Result = firstNumber + secondNumber;
    }
    public void sub()
    {
        Result = firstNumber - secondNumber;
    }
    public void mul()
    {
        Result = firstNumber * secondnumber;
    }
}