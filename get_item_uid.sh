#!/bin/bash
sudo -u postgres psql -U postgres -d wms_masterdata -c "select id from item where productattributes->>'product_sku'='$1'"


