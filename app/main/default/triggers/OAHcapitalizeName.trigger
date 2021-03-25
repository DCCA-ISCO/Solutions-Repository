trigger OAHcapitalizeName on OAH_Case_List__c (before insert, before update) {
  for (OAH_Case_List__c newCase: Trigger.new)
  {
      String caseName = String.valueOf(newCase.Name);
      newCase.Name = caseName.toUpperCase();
  }
}