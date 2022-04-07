# rtail-server_terminal_logs_linux
Broadcasting Server logs to browser  without ssh  
Tail your logs from a web interface - rtail
Let us say you want to see realtime some logs like those coming from your lean release, deploy and e2e pipeline. Here is how to use rtail to expose logs streams on a web interface:
#Expose streams using rtail-server
# sudo npm install -g rtail

# mkdir ~/rtail-server

# cd ~/rtail-server

# Create a process.yaml in that directory
apps:
  - script : rtail-server
    name: 'rtail-server'
    instances: 0
    exec_mode: cluster
    merge_logs: true
    args: "--web-port 8080 --web-host 127.0.0.1"
Run it
# pm2 start process.yaml
# pm2 save
# logs are in ~/.pm2

 Use PM2 to run your application as a process.
# pm2 start npm -- start

 Run rtail-server which will work as a reciever
rtail-server --web-version stable
 You can run rtail-server as a process also using PM2. Execute :
pm2 start rtail-server.
#  http://localhost:8888 and you will get a screen like this


/////////////////////////////////////
Run nodetest server start  check output on browser  
# node server.js | rtail --id namestreamid  --host localhost 
At this point http://localhost:8080 should list the available streams and the log traces coming in from them.

