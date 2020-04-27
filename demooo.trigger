trigger demooo on Account (before update) {

for(Account acc : Trigger.New)
{


acc.Type ='Other';
 
                         
}

}