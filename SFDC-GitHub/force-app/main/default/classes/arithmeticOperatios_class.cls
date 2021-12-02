public class arithmeticOperatios_class{
    public Integer xvalue {set;get;}
    public Integer Yvalue {set;get;}
    public Integer result {set;get;}
    public String operation {set;get;}
        public pageReference add(){
            result = xvalue + yvalue;
            operation='ADDITION';
            return null;
        }
     public pageReference sub(){
            result = xvalue - yvalue;
            operation='SUBTRACTION';
            return null;
        }
     public pageReference mul(){
            result = xvalue * yvalue;
            operation='MULTIPLICATION';
            return null;
        }
     public pageReference div(){
            result = xvalue / yvalue;
            operation='DIVISON';
            return null;
        }
}