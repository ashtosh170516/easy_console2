#!/bin/bash
all_created_order () {
    echo "All Orders which is in created "
    echo "<br>"
    if [ "$1" -eq "1" ]; then
       echo '<pre>'
       sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript order_node search_by "[[{'status', 'equal','created'}], 'key']."
       echo '</pre>'
    elif [ "$1" -eq "2" ]; then
       echo '<pre>'
       sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript order_node search_by "[[{'status', 'equal', 'created'}], 'record']."
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
echo '<title>all_pending_order</title>'
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
echo '<span class="details"style="margin-right:-21px">Enter 1 for Key and 2 for Record</span>'
echo '<input type="number" name="Type 1 for key and 2 for record" size=12 placeholder="Enter 1 or 2" required>'
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
  echo "$QUERY_STRING<br>"
  echo "<br>"
  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
   # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -n 's/^.*record=\([^ ]*\).*$/\1/p'`

     echo "created_orders" $XX
     echo '<br>'
     all_created_order $XX


  # all created order $XX

  fi
echo '</div>'
echo '</div>'
echo '<script type="text/javascript">function showHide() { document.getElementById("hidden_div").style.display="block";}</script>'
echo '<script type="text/javascript">function redirect() { var url = "/usr/lib/cgi-bin/butl.sh"; window.location(url);}</script>'
echo '</body>'
echo '</html>'

exit 0
