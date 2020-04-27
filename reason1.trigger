trigger reason1 on Lead (before update) {
String Newval,oldval;
for(Lead templead : trigger.new)
{
if(trigger.newMap.get(templead.id).CR20__Reason__c!= trigger.oldMap.get(templead.id).CR20__Reason__c && templead.CR20__Reason__c != null)
{
Date dt = system.today();

system.debug('dt '+dt );

Newval = String.valueof(dt ) +'-'+templead.CR20__Reason__c;
oldval = string.valueof(dt) + '-'+trigger.OldMap.get(templead.id).CR20__Reason__c ;

system.debug('newvalue'+Newval);

if(templead.Description == null ){
templead.Description +='\n' + oldval;
}
else
{

templead.Description +='\n' + Newval ;
}

}
}
}