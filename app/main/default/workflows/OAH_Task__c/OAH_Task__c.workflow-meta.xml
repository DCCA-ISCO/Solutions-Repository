<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Assignee_of_Task</fullName>
        <description>Notify Assignee of Task</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>OAH_Email_Templates/Notify_of_Task_Assigned</template>
    </alerts>
    <alerts>
        <fullName>Notify_Sender_of_Task_Completion</fullName>
        <description>Notify Sender of Task Completion</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>From__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>OAH_Email_Templates/Notify_Sender_of_Completion</template>
    </alerts>
</Workflow>
