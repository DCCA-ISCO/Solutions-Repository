@isTest
private class OAHAccessCaseCreationBoardTest {
    static testMethod void TestCreateAccess() {
        //Select user by alias
        User u1 = [SELECT Id FROM User WHERE
                   Id in ( SELECT AssigneeId FROM PermissionSetAssignment
                           WHERE PermissionSet.Name = 'OAH_Admin') Limit 1];
        
        //Run As user specified
        System.RunAs(u1){
        
            OAH_Case_Creation_Board__c OAHObj = new OAH_Case_Creation_Board__c(Board__c = 'PDH', Sequential_Number_Length__c = 3);
            Test.startTest();
            
            System.debug('Testing create access to OAH_Case_Creation_Board for user ' + u1);
            try {
                insert OAHObj;
            } catch (DmlException e) {
                System.assertEquals('No access to obj OAH_Case_Creation_Board__c for OAH_Admin permission set', 
                                     e.getDmlStatusCode(0));
            }
            Test.stopTest();
        
            List<OAH_Case_Creation_Board__c> boardList = [SELECT Board__c from OAH_Case_Creation_Board__c];
            system.assertEquals(1, boardList.size());
              }
    }
}