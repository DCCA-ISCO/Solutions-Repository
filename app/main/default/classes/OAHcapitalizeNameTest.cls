@isTest
private class OAHcapitalizeNameTest {
    static testMethod void capNameTest() {
        // Create Case Name for test
        OAH_Case_List__c newCase = new OAH_Case_List__c();
        newCase.Name = 'testname';
        newCase.Case_Name__c = 'test';
        newCase.Date_Filed__c = system.today();
        newCase.Fee_Required__c = 'Paid';
        Test.startTest();
        insert newCase;
        Test.stopTest();
        
        List<OAH_Case_List__c> caseList = [SELECT Name from OAH_Case_List__c WHERE Name = 'TESTNAME'];
        system.assertEquals(1,caseList.size());
    }
}