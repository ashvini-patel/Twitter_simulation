Impemented the full brief.

NOTE: The distributed implementation of this program depends on the init.getif() system call. If the first IP address returned is not the address of the machine on the local network, no node can be named correctly.
Hence nodes can’t connect.

Group Members:

1) Ashvini Patel
2) Dhruv Mahajan

How to run the project:

The Client simulator and server are two different processes. These can be on the same or different machines (two terminals) on the same local network but they must get the correct IP address from the init.getif() system call.

Step 1) 
To run Server
./project4 server

Step 2
To run client simumator
./project4 <numclients> <minimumActivities> <IP Address of the Server>

example:  ./proejct4 1000 100 192.168.0.17

If running on the same machine, pls still provied the IP address of the server node.

Minimum activities: acts
    Top 1% of the clients do at least 20 times the minumum activities.
    Next 9% of the clients do at least 10 times the minumum activities.
    Next 50% of the clients do at least 2 times the minumum activities.
    Rest 40% of the clients do at least the minumum activities.
    
If the input is ./proejct4 1000 100 192.168.0.17, The total requests in the system will be: 250,000
 
Sample summary stats

Summary Statics
Total time (Seconds): 14.156
Number of requests generated and served.
   Minimum activities : 100
   Top 1% of the clients do at least 20 times the minumum activities.
   Next 9% of the clients do at least 10 times the minumum activities.
   Next 50% of the clients do at least 2 times the minumum activities.
   Rest 40% of the clients do at least the minumum activities.
Total activities, approx = 2000 * 10.0 + 1000 * 90.0 + 200 * 500.0 + 100 * 400.0
Approx total: 250000
Approx. activities per second: 17660.35603277762
