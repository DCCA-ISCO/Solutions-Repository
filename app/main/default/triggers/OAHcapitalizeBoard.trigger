trigger OAHcapitalizeBoard on OAH_Case_Creation_Board__c (before insert, before update) {
  for (OAH_Case_Creation_Board__c newBoard: Trigger.new)
  {
      String board = String.valueOf(newBoard.Board__c);
      newBoard.Board__c = board.toUpperCase();
  }
}