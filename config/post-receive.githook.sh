#!/bin/sh
echo "========= LET THE PARTY BEGIN =========="
cd /var/www/protoboard
git pull origin master
echo "========= UPDATING SUBMODULES =========="
git submodule update
echo "=========== CHECKOUT IS DONE ==========="
npm install
echo "====== NODE PACKAGES ARE UPDATED ======="
bower install --allow-root
echo "=========== BOWER IS UPDATED ==========="
ember build -prod
echo "========== IT'S ALIIIIIIVE!!! =========="

