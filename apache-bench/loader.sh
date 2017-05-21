#!/bin/bash

php -f create-db-tbl.php

mysqlimport -u root --local benchmark_0 benchmark_tbl.ini --lines-terminated-by="\n" --fields-terminated-by=","

