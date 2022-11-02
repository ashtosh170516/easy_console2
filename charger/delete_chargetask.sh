#!/bin/bash
delete_chargetask () {
    echo "Checking any butler with same Taskkey"
    echo "<br>"
    echo "<br>"
    echo '<pre>'
    sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo search_by "[[{'taskkey', 'equal', <<\"$1\">>}], 'record']."
    echo '</pre>'
    bot_ip=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo search_by "[[{'taskkey', 'equal', <<\"$1\">>}], 'record']." | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
    echo "<br>"
    echo "Butler Ip: $bot_ip"
    echo "<br>"
    if [ ! -n "$bot_ip" ]
    then
        echo "Butler is Not Present....Deleting a charge task"
        curl -X POST -H 'Content-Type: application/json' -d '{"table_name":"chargetask","key" : "'"$1"'"}' localhost:8181/api/mhs/task/delete
        echo "<br>"
        echo "Ok....Done"
        
    else
        echo "Butler Found Aborting Charge task deletion"
        echo "<br>"
    fi
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>Delete chargetask</title>' 
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
echo '<span class="details">Enter Charger TaskKey</span>' 
echo '<input type="text" name="chargeTask_Key" style="padding-right:6px" size=12 placeholder="chargeTask_Key" required>' 
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
     XX=`echo "$QUERY_STRING" | sed -n 's/^.*Task_Key=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	 
	   echo "chargeTask_Key: <<"$XX">>"
     echo '<br>'
     delete_chargetask $XX
     
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
