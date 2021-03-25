trigger OAHTaskApexSharing on OAH_Task__c (after insert) {
// When an OAHTask is assigned, ensure previous owner retains visibility to task
    if(trigger.isInsert){
        // Create a new list of sharing objects for Job
        List<OAH_Task__Share> taskShrs  = new List<OAH_Task__Share>();
        
        OAH_Task__Share FROMShr;
        
        for(OAH_Task__c task : trigger.new){
        
//            task.OwnerId = task.Assigned_To__c;
        
            // Instantiate the sharing objects
            FROMShr = new OAH_Task__Share();
            
            // Set the ID of record being shared
            FROMShr.ParentId = task.Id;
            
            // Set the ID of user or group being granted access
            FROMShr.UserOrGroupId = task.OwnerId;
            
            // Set the access level
            FROMShr.AccessLevel = 'edit';
            
            // Set the Apex sharing reason
            FROMShr.RowCause = Schema.OAH_Task__Share.RowCause.Share_Task_With_Creator__c;
            
            // Add objects to list for insert
            taskShrs.add(FROMShr);
        }
        
        // Insert sharing records and capture save result 
        // The false parameter allows for partial processing if multiple records are passed 
        // into the operation 
        Database.SaveResult[] lsr = Database.insert(taskShrs,false);
    }
    
}