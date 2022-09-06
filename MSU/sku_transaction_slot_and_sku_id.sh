#!/bin/bash
source /home/gor/easy_console/variable.sh
sku_transaction_slot_and_sku_id () {
    echo "<br>"
    echo '<pre>'
    sshpass -p "$PASSWORD_OF_PLATFORM_DB" ssh -o StrictHostKeyChecking=no -t $USERNAME@$PLATFORM_DB_IP "/home/gor/easy_console/get_item_uid.sh $1"
    echo '</pre>'
    product_uid=`sshpass -p "$PASSWORD_OF_PLATFORM_DB" ssh -o StrictHostKeyChecking=no -t $USERNAME@$PLATFORM_DB_IP "/home/gor/easy_console/get_item_uid.sh $1" | head -3 | tail -1 | grep -o '[[:digit:]]*'`
    echo "<br>"
    echo "Internal Id for SKU is:" $product_uid
    echo "<br>"
    echo "SKU transactions against Slot Id: $2 and SKU Id : $1"
    echo "<br>"
    echo '<pre>'
    sudo -u postgres psql -U postgres -d butler_dev -c "select * from inventory_transaction_archives where item_id = '$product_uid' AND slot = '$2' AND time > '$3' AND time < '$4' order by time desc"
    echo '</pre>'
}
echo "Content-type: text/html" 
echo "" 
echo '<html>' 
echo '<head>' 
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 
echo '<title>transactions against slot and sku</title>' 
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
echo '<span class="details">SKU_ID</span>' 
echo '<input type="text" name="SKU_ID" style="padding-right:6px" size=12 placeholder="SKU_ID" required>' 
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
     XX=`echo "$QUERY_STRING" | sed -n 's/^.*SKU_ID=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     YY=`echo "$QUERY_STRING" | sed -n 's/^.*Slot_ID=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	   ZZ=`echo "$QUERY_STRING" | sed -n 's/^.*From_time=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     AA=`echo "$QUERY_STRING" | sed -n 's/^.*To_time=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
  
     echo "SKU_ID: " $XX
     echo '<br>'
     echo "Slot_ID: " $YY
     echo '<br>'
     echo "From_time: " $ZZ
     echo '<br>'
     echo "To_time: " $AA
     echo '<br>'
     sku_transaction_slot_and_sku_id $XX $YY $ZZ $AA
  fi
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
