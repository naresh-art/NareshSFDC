public class actionsupport_class {

    public String secondaryvalue4 { get; set; }

    public boolean dis5 { get; set; }

    public String secondaryvalue3 { get; set; }

    public boolean dis4 { get; set; }

    public String secondaryvalue2 { get; set; }

    public boolean dis3 { get; set; }

    public boolean dis2{ get; set; }

    public boolean dis1 { get; set; }

    public String secondaryvalue1 { get; set; }

    public String secondaryvalue { get; set; }

    public String selected { get; set; }
    
     
     list<selectoption> option = new list<selectoption>();
     list<selectoption> options = new list<selectoption>();
     list<selectoption> optionss = new list<selectoption>();
     list<selectoption> optionsss = new list<selectoption>();
     list<selectoption> optionssss = new list<selectoption>();
     list<selectoption> optionsssss = new list<selectoption>();
      
      
      public actionsupport_class()
      {
       dis1 = true;
       dis2 = true;
       dis3 = true;
       dis4 = true;
       dis5 = true;
       
      }
    
    public list<selectoption> getalphbts()
    {
      option.add(new selectoption('','--None--'));
      option.add(new selectoption('A','A'));
      option.add(new selectoption('B','B'));
      option.add(new selectoption('C','C'));
      option.add(new selectoption('D','D'));
      option.add(new selectoption('E','E'));
      option.add(new selectoption('All','ALL'));
     return option;
    }
    
    public list<selectoption> getremngalpnbt()
    {
      options.add(new selectoption('','--None--'));
      options.add(new selectoption('D','Animal'));
      options.add(new selectoption('E','Birds'));
      options.add(new selectoption('F','Camels'));
      
     return options;
    }
    
     public list<selectoption> getremngalpnbt1()
     {
      optionss.add(new selectoption('','--None--'));
      optionss.add(new selectoption('G','Humans'));
      optionss.add(new selectoption('H','Trees'));
      optionss.add(new selectoption('I','Nature'));
      
     return optionss;
    }
    
    public list<selectoption> getremngalpnbt2()
    {
      optionsss.add(new selectoption('','--None--'));
      optionsss.add(new selectoption('G','Humans'));
      optionsss.add(new selectoption('H','Trees'));
      optionsss.add(new selectoption('I','Nature'));
      
     return optionss;
    }
    
    public list<selectoption> getremngalpnbt3()
    {
      optionssss.add(new selectoption('','--None--'));
      optionssss.add(new selectoption('G','Humans'));
      optionssss.add(new selectoption('H','Trees'));
      optionssss.add(new selectoption('I','Nature'));
      
     return optionss;
    }
    
    public list<selectoption> getremngalpnbt4()
    {
      optionsssss.add(new selectoption('','--None--'));
      optionsssss.add(new selectoption('G','Humans'));
      optionsssss.add(new selectoption('H','Trees'));
      optionsssss.add(new selectoption('I','Nature'));
      
     return optionss;
    }
    
    public void dismethod()
    {
     option.clear();
     options.clear();
     optionss.clear();
    if(selected == 'A')
    {
      dis1 = false;
      dis2 = true;
      dis3 = true;
      dis4 = true;
      dis5 = true;
    }
    else{
    if(selected == 'B'){
         dis1 = true;
         dis2 = false;
         dis3 = true;
         dis4 = true;
         dis5 = true;
     
    }
    
     if(selected == 'C'){
         dis1 = true;
         dis2 = true;
         dis3 = false;
         dis4 = true;
         dis5 = true;
     }
      
      if(selected == 'D'){
         dis1 = true;
         dis2 = false;
         dis3 = true;
         dis4 = false;
         dis5 = true;
      }
      
      if(selected == 'E'){
         dis1 = true;
         dis2 = false;
         dis3 = true;
         dis4 = true;
         dis5 = false;
      }
      
      
      if(selected =='all'){
         dis1 = false;
         dis2 = false;
         dis3 = false;
         dis4 = false;
         dis5 = false;
        
      }
     }
    }
}