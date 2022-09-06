#!/bin/bash
all_temporary_unfulfillable() {
    echo "All Orders which are temporary_unfulfillable"
    echo "<br>"
    if [ "$1" -eq "1" ]; then
       echo '<pre>'
       sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript order_node search_by "[[{'status', 'equal','temporary_unfulfillable'}], 'key']."
       echo '</pre>'
    elif [ "$1" -eq "2" ]; then
       echo '<pre>'
       sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript order_node search_by "[[{'status', 'equal', 'temporary_unfulfillable'}], 'record']."
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
echo '<title>all_temporary_unfulfillable</title>' 
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
echo '<span class="details" style="margin-right:-16px">Enter 1 for key and 2 for record</span>' 
echo '<input type="number" name="ORDER_ID" size=12 placeholder="Enter 1 for key and 2 for record" required>' 
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
echo '<div class="container" style="position:absolute; font-size:13px; width:91.3%;">'
  
  # Make sure we have been invoked properly.

  if [ "$REQUEST_METHOD" != "GET" ]; then
        echo "<hr>Script Error:"\
             "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
             "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
        exit 1
  fi

  # If no search arguments, exit gracefully now.
  #echo "$QUERY_STRING<br>"
  echo "<br>"
  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
   # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
	
     echo "ORDER_ID: " $XX
     echo '<br>'
     all_temporary_unfulfillable $XX 
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
