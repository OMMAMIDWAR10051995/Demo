trigger HelloWorld on Lead (before update) {
for(Lead l:Trigger.new)
{
l.Firstname='hello';
l.lastname='world';
}

}