#!/bin/bash
Purging_Butler () {
    sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butler_test_functions purge_butler "[$1]."
    echo "Purging Done for Butler $1...."
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>purge butler</title>' 
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
echo '<span class="details">Butler_ID</span>' 
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
     

     Purging_Butler $XX 
     
     
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0

