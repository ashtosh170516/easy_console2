#!/bin/bash
reset_unprocessable () {
    echo "resetting unprocessable Orders..."
    echo "<br>"
    echo '<pre>'
    sudo /opt/butler_server/erts-11.1.1/bin/escript /usr/lib/cgi-bin/rpc_call.escript station_recovery reset_all_unprocessable "['order']."
    echo '</pre>'
	echo "<br>"
	echo "DONE"
	echo "<p>&#128512;</p>"

}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>reset unprocessable orders</title>'
echo '<link rel="stylesheet" href="/rack.css" type="text/css">'
echo '</head>'
echo '<body>'
echo '<div class=container>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
reset_unprocessable
echo '</div>'
echo '</body>'
echo '</html>'

exit 0
