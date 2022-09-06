#!/bin/bash
Unlimited_loop_test_for_lift () {
    bot_ip=`sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butlerinfo get_by_id "[$1]." | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
    echo "Butler Ip: $bot_ip"
    echo "<br>" 
    if [ ! -n "$bot_ip" ]
    then
        echo "Wrong Butler ID"
    else
        ping -c1 -W 1 $bot_ip   >/dev/null
        if [ $? -eq 0 ]; then
            sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript butler_test_functions test_butler_loop_start "[$1, [{\""$2"\",$3},{'up'},{\""$4"\",$5},{'down'},{\""$4"\",$5},{'up'},{\""$2"\",$3},{'down'}]]."
            echo "<br>"
            echo "OK Done...."
        else
            echo "Butler is not ON.....turn on Butler FIRST"
        fi
    fi
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>Unlimited Lift test </title>' 
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
echo '<span class="details">Source_Barcode</span>' 
echo '<input type="text" name="Source_Barcode" style="padding-right:6px" size=12 placeholder="Source_Barcode" required>'
echo '<span class="details">Source Direction</span>' 
echo '<input type="number" name="Source Direction" style="padding-right:6px" size=12 placeholder="Source Direction" required>' 
echo '<span class="details">Destination_Barcode</span>' 
echo '<input type="text" name="Destination_Barcode" style="padding-right:6px" size=12 placeholder="Destination_Barcode" required>' 
echo '<span class="details">Destination Direction</span>' 
echo '<input type="number" name="Destination Direction" style="padding-right:6px" size=12 placeholder="Destination Direction" required>' 
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
     YY=`echo "$QUERY_STRING" | sed -n 's/^.*Source_Barcode=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     ZZ=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){4}.*/\2/'`
     AA=`echo "$QUERY_STRING" | sed -n 's/^.*Destination_Barcode=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     BB=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){7}.*/\2/'`
     
     echo "Butler_ID: " $XX
     echo '<br>'
     echo "Source_Barcode: " $YY
     echo '<br>'
     echo "Source Direction: " $ZZ
     echo '<br>'
     echo "Destination_Barcode: " $AA
     echo '<br>'
     echo "Destination Direction: " $BB
     echo '<br>'

     Unlimited_loop_test_for_lift $XX $YY $ZZ $AA $BB
     
     
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
