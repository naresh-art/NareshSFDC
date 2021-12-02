global class campingDesignClass {
@auraEnabled
    public static List<Account> GetLeads()
    {
        return [select id, name, industry from Account limit 10];
    }
}