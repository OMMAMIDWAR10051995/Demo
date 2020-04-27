trigger DATEWISE on Lead (before insert) {

for(lead templead :trigger.new){
//if(templead.CR20__Date1__c == NULL ){
templead.CR20__Date2__c = templead.CR20__Date1__c;
templead.CR20__Date3__c = templead.CR20__Date1__c;
templead.CR20__Date4__c = templead.CR20__Date1__c;
//}
}
}