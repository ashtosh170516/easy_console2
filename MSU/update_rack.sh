#!/bin/bash
Rack_position_update () {
    if [ "$4" -eq "1" ]; then
        echo "Make lift Down First by Doing NFS that Butler"
        echo "<br>"
    elif [ "$4" -eq "0" ]; then
        barcode_validation=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript gridinfo search_by "[[{'barcode', 'equal', \""$2"\"}], 'key']." | grep -oP '\[\K[^\]]+'`
        echo "<br>"
        echo "Your given barcode coordinate is: $2"
        echo "<br>"
        if [ ! -n "$barcode_validation" ]
        then
            echo "You have type wrong barcode"    
        else
            echo "Updating rack location"
            #sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript mhs_operation_utilities update_rack_position "[<<\"$1\">>,$3,\""$2"\", 'null']." 
           update=`curl -X POST -H 'Content-Type: application/json' -d '{"rack_id": "'"$1"'","rack_direction":'$3',"barcode": "'"$2"'","butler_id": null}' localhost:8181/api/send_updated_rack_position`
           echo "<br>"
           echo "Rack updated Done: $update"
           echo "<br>"
        fi    
    else
        echo "Please type correct lifted state "
    fi
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>Update rack position</title>' 
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
echo '<span class="details">Rack_ID</span>' 
echo '<input type="text" name="Rack_ID" style="padding-right:6px" size=12 placeholder="Rack_ID" required>' 
echo '<span class="details">Barcode</span>' 
echo '<input type="text" name="Barcode" style="padding-right:6px" size=12 placeholder="Barcode" required>'
echo '<span class="details">Direction</span>' 
echo '<input type="number" name="Direction" style="padding-right:6px" size=12 placeholder="Direction" required>'
echo '<span class="details">Lifted_state</span>' 
echo '<input type="number" name="Lifted_state" style="padding-right:6px" size=12 placeholder="1 -> up, 0 -> down" required>'
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
     YY=`echo "$QUERY_STRING" | sed -n 's/^.*Barcode=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     ZZ=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){4}.*/\2/'`
     AA=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){5}.*/\2/'`
  
     echo "Rack_ID: " $XX
     echo '<br>'
     echo "Barcode: " $YY
     echo '<br>'
     echo "Direction: " $ZZ
     echo '<br>'
     echo "Lifted_state: " $AA
     echo '<br>'
     Rack_position_update $XX $YY $ZZ $AA
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
