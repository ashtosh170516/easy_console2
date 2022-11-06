#!/bin/bash
clear_task_from_butler () {
    echo '<pre>'
    taskkey=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo search_by "[[{'id', 'equal', $1}], ['taskkey']]." | cut -d'"' -f2`
    tasktype=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo search_by "[[{'id', 'equal', $1}], ['tasktype']]." | sed 's/.*\[\([^]]*\)].*/\1/'`
    echo '</pre>'
    echo "<br>"
    if [ "$tasktype" == "picktask" ] ; then
        task_status=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript ppstaskrec search_by "[[{'task_key', 'equal', <<\"$taskkey\">>}], ['status']]." | sed 's/.*\[\([^]]*\)\].*/\1/g' | sed 's/^.*,//;s/}$//'`
        if [ "$task_status" == "complete" ] || [ -z $task_status ]; then
                echo "Clearing task & Subtask from butler"
                echo "<br>"
                sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo update_columns_by_id "[$1,[{'taskkey','null'},{'tasktype','null'}]]."
                sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butler_functions clear_butler_subtasks "[$1]."
                echo "<br>"
        else
          echo "Task key exist and not in complete state Taskkey:$taskkey , type:$tasktype , Status:$task_status "
        fi
    elif [ "$tasktype" == "audittask" ]; then
        task_status=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript audittaskrec search_by "[[{'task_key', 'equal', <<\"$taskkey\">>}], ['status']]." | sed 's/.*\[\([^]]*\)\].*/\1/g' | sed 's/^.*,//;s/}$//'`
        if [ "$task_status" == "complete" ] || [ -z $task_status ]; then
                echo "Clearing task & Subtask from butler"
                echo "<br>"
                sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo update_columns_by_id "[$1,[{'taskkey','null'},{'tasktype','null'}]]."
                sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butler_functions clear_butler_subtasks "[$1]."
                echo "<br>"
        else
          echo "Task key exist and not in complete state Taskkey:$taskkey , type:$tasktype , Status:$task_status "
        fi
    else
        echo "Butler contain different tasktype than pick/audit : $tasktype"
    fi    
    echo "<br>"
            
}
echo "Content-type: text/html" 
echo "" 

echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>Clear storing task from Butler</title>' 
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
echo '<span class="details">Enter Butler_ID</span>' 
echo '<input type="number" name="Butler_ID" style="padding-right:6px" size=12 placeholder="Enter Butler_ID" required>' 
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
     
     echo "Butler_ID: " $XX
     echo '<br>'
     

     clear_task_from_butler $XX 
     
     
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0

