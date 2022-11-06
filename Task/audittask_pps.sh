#!/bin/bash
audit_task_pps () {
    echo "All Audit Task on PPS_ID : $1"
    if [ "$2" -eq "1" ]; then
      echo '<pre>'
       sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript audittaskrec search_by "[[{'pps_id', 'equal',$1},{'status', 'notequal', 'complete'}], 'key']."
       echo '</pre>'
    elif [ "$2" -eq "2" ]; then
      echo '<pre>'
       sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript audittaskrec search_by "[[{'pps_id', 'equal',$1},{'status', 'notequal', 'complete'}], 'record']."
       echo '</pre>'
    else 
        echo "Wrong Key pressed"
    fi
}
echo "Content-type: text/html" 
echo "" 

echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>All audit task associated to PPS</title>' 
echo '<link rel="stylesheet" href="nextPage.css" type="text/css">' 
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
echo '<span class="details">Enter PPS_ID</span>' 
echo '<input type="number" name="PPS_ID" style="padding-right:6px" size=12 placeholder="PPS_ID" required>' 
echo '<span class="details">Type 1 for key and 2 for record</span>' 
echo '<input type="number" name="Type 1 for key and 2 for record" style="padding-right:6px" size=12 placeholder="1 or 2" required>' 
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
   # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
	 YY=`echo "$QUERY_STRING" | sed -n 's/^.*record=\([^ ]*\).*$/\1/p'`
	
     echo "PPS_ID: " $XX
     echo '<br>'
	   echo "Type 1 for key and 2 for record: " $YY
     echo '<br>'
     audit_task_pps $XX $YY  
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0