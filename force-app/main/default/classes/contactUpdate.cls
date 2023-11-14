public class contactUpdate {
public void resetRouteDelays(){
        List<Contact> routeDelayList = new List<Contact>();
          for (Contact rddObj : routeDelayList) {
            rddObj.LastName='Time';
            rddObj.LeadSource = 'Web';
             routeDelayList.add(rddObj);
          }
          if(routeDelayList!=null && routeDelayList.size()>0){
            try{
                update routeDelayList;
            }
            catch(Exception ex){
                throw new AuraHandledException(ex.getMessage());
    
            }
          }
}
}