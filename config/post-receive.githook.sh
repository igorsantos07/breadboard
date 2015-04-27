#!/bin/sh
echo "========= LET THE PARTY BEGIN =========="
GIT_WORK_TREE=/var/www/protoboard git checkout -f
cd /var/www/protoboard
echo "========= UPDATING SUBMODULES =========="
git submodule init
git submodule update
echo "=========== CHECKOUT IS DONE ==========="
npm install
echo "====== NODE PACKAGES ARE UPDATED ======="
bower install --allow-root
echo "=========== BOWER IS UPDATED ==========="
ember build -prod
echo "========== IT'S ALIIIIIIVE!!! =========="
