#!/bin/bash
sku_transaction_slot_id () {
    echo "<br>"
    echo "SKU transactions against Slot Id: $1"
    echo '<pre>'
    sudo -u postgres psql -U postgres -d butler_dev -c "select * from inventory_transaction_archives where slot = '$1' AND time > '$2' AND time < '$3' order by time desc"
    echo '</pre>'
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>sku transactions against any slot</title>' 
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
echo '<span class="details">Slot_ID</span>' 
echo '<input type="text" name="Slot_ID" style="padding-right:6px" size=12 placeholder="Slot_ID" required>' 
echo '<span class="details">From_time</span>' 
echo '<input type="date" name="From_time" style="padding-right:6px" size=12 placeholder="From" required>'
echo '<span class="details">To_time</span>' 
echo '<input type="date" name="To_time" style="padding-right:6px" size=12 placeholder="To" required>'
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
     XX=`echo "$QUERY_STRING" | sed -n 's/^.*Slot_ID=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	   YY=`echo "$QUERY_STRING" | sed -n 's/^.*From_time=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     ZZ=`echo "$QUERY_STRING" | sed -n 's/^.*To_time=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
  
     echo "Slot_ID: " $XX
     echo '<br>'
     echo "From_time: " $YY
     echo '<br>'
     echo "To_time: " $ZZ
     echo '<br>'
     sku_transaction_slot_id $XX $YY $ZZ
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
