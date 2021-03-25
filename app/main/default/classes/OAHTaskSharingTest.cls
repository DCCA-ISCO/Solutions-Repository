@isTest
private class OAHTaskSharingTest {

    @testSetup static void setupTestData() {
        UserRole r = new UserRole(DeveloperName = 'MyCustomRole', Name = 'My Role');
        insert r;
        User u1 = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
            LastName = 'last',
            Email = 'mpadgett@dcca.hawaii.gov',
            Username = 'User1@idontknow.com',
            Alias = 'User1',
            EmailEncodingKey = 'ISO-8859-1',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            LanguageLocaleKey = 'en_US',
            UserRoleId = r.Id);
        insert u1;
        User u2 = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard Platform User'].Id,
            LastName = 'last',
            Email = 'mpadgett@dcca.hawaii.gov',
            Username = 'User2@idontknow.com',
            Alias = 'User2',
            EmailEncodingKey = 'ISO-8859-1',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            LanguageLocaleKey = 'en_US',
            UserRoleId = r.Id);
        insert u2;
    }
    
    @isTest static void TestTaskAssigned() {
        Test.startTest();
        User u1 = [SELECT Id from User where Alias = 'User1'];
        User u2 = [SELECT Id from User where Alias = 'User2'];
        OAH_Task__c OAHTask = new OAH_Task__c(Assigned_To__c = u1.Id, From__c = u2.Id);
        insert OAHTask;
        Test.stopTest();
    }

}