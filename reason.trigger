trigger reason on Lead (before update) {
String Newval,Oldval;
List<Lead> updatelist = new List<Lead>();
for(Lead templead : trigger.new)
{
if(trigger.newMap.get(templead.id).CR20__Reason__c!= trigger.oldMap.get(templead.id).CR20__Reason__c)
{
Date dt = system.today();

system.debug('dt '+dt );

Newval = String.valueof(dt ) +'-'+templead.CR20__Reason__c;

system.debug('newvalue'+Newval);

Oldval = String.valueof(dt ) +'-'+trigger.oldMap.get(templead.id).CR20__Reason__c;

system.debug('Oldval'+Oldval);


if(trigger.oldMap.get(templead.id).CR20__Reason__c== null){
templead.Description = Newval ;
system.debug('templead new'+templead);
}
else
{
templead.Description +='\n' + Newval ;

}

}

}

}