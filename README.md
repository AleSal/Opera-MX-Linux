# Opera-MX-Linux
Solution for Opera browser not playing Twitter and other videos on sites. 

  After migrating to Opera browser on Linux I found myself unable to play some videos from Twitter and sometimes from youtube. There are lots of possible solutions around the web but none of them has all the information neede to do it successfully. After gathering all this information I was abe to come up with a solution that worked. 

 If you are facing the same issues with video feel free to download and try this as a solution. 
 
 It performs the installation of the most recent version of codecs-libffmpeg-extra that we need for it to work. I uploaded the most recent version for the script and I'll try to keep it up to date.
 
 If after the installation your browser stops openning it means the libffmpeg version could be outdated, to see if that is the case you cna check your current chromedriver version by openning a command line and typing:

  chromedriver -v
  
  The output should be something like this: 
  
  $ chromedriver -v
ChromeDriver 106.0.5249.91

  Enjoy it.
