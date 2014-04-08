BEGIN {
   RS = ORS = "\r\n"
   HttpService = "/inet/tcp/0/google.com/80"
   print "GET http://google.com"     |& HttpService
   while ((HttpService |& getline) > 0)
	  print $0
   close(HttpService)
 }
