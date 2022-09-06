#!/bin/bash
remove_emergency () {
    echo "removing emergency..."
    echo "<br>"
    echo "<br>"
	echo '<pre>'
    curl --location --request POST 'http://172.30.252.223:8181/api/emergency/off/' \--header 'Content-Type: application/json' \--data-raw '{}'
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Sremoving emergency</title>'
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

remove_emergency

echo '</div>'
echo '</body>'
echo '</html>'

exit 0
