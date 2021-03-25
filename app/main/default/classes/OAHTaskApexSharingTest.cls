@isTest
private class OAHTaskApexSharingTest {
  static testMethod void TaskSharingTest() {
    // Trigger will be tested on OAH_Task__c insert
    User u1 = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' and IsActive = TRUE Limit 1];
    
    Test.startTest();
    OAH_Task__c newTask = new OAH_Task__c();
    newTask.Assigned_To__c = u1.id;
    insert newTask;
    Test.stopTest();
    
    List<OAH_Task__c> taskList = [SELECT Assigned_To__c from OAH_Task__c];
    system.assertEquals(1, taskList.size());
    
  }
}