trigger HelloWorldTrigger1 on Account (before insert)
{
    System.debug('Hello World!');

}