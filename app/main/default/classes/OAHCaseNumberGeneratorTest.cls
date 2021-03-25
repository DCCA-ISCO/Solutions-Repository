@isTest
private class OAHCaseNumberGeneratorTest {
    static testMethod void CaseNbrGenTest() {
        // Trigger will be tested on OAH_Case_List__c insert, but create other records here
        List<OAH_Case_Creation_Board__c> lstBoard = new List<OAH_Case_Creation_Board__c>();
        OAH_Case_Creation_Board__c newBoard;
        newBoard = new OAH_Case_Creation_Board__c(name='Procurement Decisions and Hearings',Board__c='PDH',Sequential_Number_Length__c=3);
        lstBoard.add(newBoard);
        newBoard = new OAH_Case_Creation_Board__c(name='Licensing Cases',Board__c='*-LIC',Sequential_Number_Length__c=3);
        lstBoard.add(newBoard);
        newBoard = new OAH_Case_Creation_Board__c(name='ACC Only Licensing Cases',Board__c='ACC-LIC',Sequential_Number_Length__c=3);
        lstBoard.add(newBoard);
        insert lstBoard;
        
        Test.startTest();
        OAH_Case_List__c newCase = new OAH_Case_List__c();
        newCase.Name = 'PDH';
        newCase.Case_Name__c = 'Test Case';
        newCase.Division_Agency__c = 'PDH';
        newCase.Case_Type__c = 'NEW';
        newCase.Case_Phase__c = 'Intake';
        newCase.Case_Status__c = 'Open';
        newCase.Date_Filed__c = system.today();
        newCase.Fee_Required__c = 'Paid';
        insert newCase;

        OAH_Case_List__c newCase2 = new OAH_Case_List__c();
        newCase2.Name = 'PDH-2020';
        newCase2.Case_Name__c = 'Test Case';
        newCase2.Division_Agency__c = 'PDH';
        newCase2.Case_Type__c = 'NEW';
        newCase2.Case_Phase__c = 'Intake';
        newCase2.Case_Status__c = 'Open';
        newCase2.Date_Filed__c = system.today();
        newCase2.Fee_Required__c = 'Paid';
        insert newCase2;

        OAH_Case_List__c newCase3 = new OAH_Case_List__c();
        newCase3.Name = 'PDH-2020-003';
        newCase3.Case_Name__c = 'Test Case';
        newCase3.Division_Agency__c = 'PDH';
        newCase3.Case_Type__c = 'NEW';
        newCase3.Case_Phase__c = 'Intake';
        newCase3.Case_Status__c = 'Open';
        newCase3.Date_Filed__c = system.today();
        newCase3.Fee_Required__c = 'Paid';
        insert newCase3;

        // Modify previous case to contain '-P' suffix then generate new case #
        newCase3.Name = 'PDH-2020-003-P';
        update newCase3;

        OAH_Case_List__c newCase4 = new OAH_Case_List__c();
        newCase4.Name = 'PDH-2020';
        newCase4.Case_Name__c = 'Test Case';
        newCase4.Division_Agency__c = 'PDH';
        newCase4.Case_Type__c = 'NEW';
        newCase4.Case_Phase__c = 'Intake';
        newCase4.Case_Status__c = 'Open';
        newCase4.Date_Filed__c = system.today();
        newCase4.Fee_Required__c = 'Paid';
        insert newCase4;
        
        Test.stopTest();
        
        List<OAH_Case_Creation_Board__c> boardList = [SELECT Board__c from OAH_Case_Creation_Board__c WHERE Board__c = 'PDH'];
        system.assertEquals(1, boardList.size());
        
        List<OAH_Case_List__c> caseList = [SELECT Name from OAH_Case_List__c WHERE Name like 'PDH%'];
        system.assertEquals(4, caseList.size());
    }
}