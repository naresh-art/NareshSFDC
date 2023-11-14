public with sharing class AccountViewController 
{
    private ApexPages.StandardSetController standardController;

    public AccountViewController(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }

    /*public PageReference bumpCases()
    {       
        // Get the selected records (optional, you can use getSelected to obtain ID's and do your own SOQL)
        List<Account> selectedAccountsList = (List<Account>) standardController.getSelected();

        // Update records       
        for(Account selectedAccounts : selectedAccountsList)
        {
            if(selectedAccounts.Rating == null) 
                selectedAccounts.Rating = 'Hot';
            else if(selectedAccounts.Rating == 'Hot')
                selectedAccounts.Rating = 'Warm';
            else if(selectedAccounts.Rating == 'Warm')
                selectedAccounts.Rating = 'Cold';
        }       

        return null;        
    }*/

    public PageReference updateAccounts()
    {       
        // Call StandardSetController 'save' method to update (optional, you can use your own DML)
        return standardController.save();   
    }
}