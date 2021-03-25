@isTest
private class OAHcapitalizeBoardTest {
    static testMethod void CapBoardTest() {
        // Create Board for test
        OAH_Case_Creation_Board__c newBoard = new OAH_Case_Creation_Board__c();
        newBoard.Board__c = 'newBoard';
        newBoard.Sequential_Number_Length__c = 3;
        Test.startTest();
        insert newBoard;
        Test.stopTest();
        
        List<OAH_Case_Creation_Board__c> boardList = [SELECT Board__c from OAH_Case_Creation_Board__c WHERE Board__c = 'NEWBOARD'];
        system.assertEquals(1,boardList.size());
    }
}