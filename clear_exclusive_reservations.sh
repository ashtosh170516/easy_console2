#!/bin/bash
exclusive_reservation () {
    bot_ip=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo get_by_id "[$1]." | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
    echo "Butler Ip: $bot_ip"
    echo "<br>" 
    if [ ! -n "$bot_ip" ]
    then
        echo "Wrong Butler ID"
    else
        ping -c1 -W 1 $bot_ip   >/dev/null
        if [ $? -eq 0 ]; then
           echo "<br>"
           echo "Butler is online, please turn off the butler and remove from map"
           echo "<br>"
        else
           echo "<br>"
           echo "<br>"
           echo "Butler is in dead state"
           echo "<br>"
           taskkey=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo search_by "[[{'id', 'equal', $1}], ['taskkey']]." | sed 's/.*\[\([^]]*\)].*/\1/'`
    	   tasktype=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo search_by "[[{'id', 'equal', $1}], ['tasktype']]." | sed 's/.*\[\([^]]*\)].*/\1/'`
    	   if [ "$taskkey" == "null" ] && [ "$tasktype" == "null" ] ; then
    	   	echo "<br>"
    	   	echo "Taskkey and tasktype is null, clearing barcode reservation please make sure butler is not physically present in the Map"
          sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript exclusive_reservation_functions clear_butler_reservations "[$1]."
    	   	echo "<br>"
    	   else
    	   	echo "<br>"
    	   	echo "Butler is having taskkey/tasktype associated with it, clear taskkey from butler and then Try again"
    	   	echo "<br>"
    	   fi
        fi  
    fi
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>clear_exclusive_reservations</title>' 
echo '<link rel="stylesheet" href="npl.css" type="text/css">' 
echo '</head>' 
echo '<body>' 
echo '<div class=container>' 
echo '<div class="title">' 
echo '<div class="logo"><a href="home_page.php" class="navbar-brand"> <img src="/images/logo12.jpg" style="margin-top:20px;" width="45" /></a></div>' 
echo '</div>'
echo '<div class="content">' 
echo "<form method=GET action=\"${SCRIPT}\">" 
echo '<div class="user-details">' 
echo '<div class="input-box">' 
echo '<span class="details">Enter dead Butler_ID</span>' 
echo '<input type="number" name="Butler_ID" style="padding-right:6px" size=12 placeholder="Butler_ID" required>' 
echo '</div>' 
echo '<div class="button" style="width:100%;">' 
echo '<input type="submit" value="SUBMIT"style="text-align:center; height:70%;">' 
echo '<br>' 
echo '<br>' 
echo '<input type="refresh" value="REFRESH" onClick="history.back()" style="text-align:center; height:70%;">' 
echo '</div>'
echo '</form>' 
echo '</div>' 
echo '</div>' 
echo '<div class="container" style="position:absolute; font-size:13px;  width:91.3%;">'
  # Make sure we have been invoked properly.

  if [ "$REQUEST_METHOD" != "GET" ]; then
        echo "<hr>Script Error:"\
             "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
             "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
        exit 1
  fi

  # If no search arguments, exit gracefully now.
  echo "$QUERY_STRING<br>"
  echo "<br>"
  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
     echo '<hr>'
     echo '<h3 align="center">RESPONSE</h3>'
     echo '<hr>'
   # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
	 
	 echo "Butler_ID: " $XX
     echo '<br>'
     

   exclusive_reservation $XX
     
     
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
