#!/usr/bin/env bash
set -euo pipefail
for file in app/index.html app/css/style.css app/js/script.js Dockerfile docker-compose.yml; do
  test -s "$file" || { echo "FAIL: $file missing or empty"; exit 1; }
  echo "PASS: $file"
done
grep -q 'Hasnain Abbas | DevOps Engineer Portfolio' app/index.html
grep -q 'css/style.css' app/index.html
grep -q 'js/script.js' app/index.html
grep -q '8082:80' docker-compose.yml
echo 'ALL PORTFOLIO TESTS PASSED'
