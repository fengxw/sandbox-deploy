#!/bin/bash

# Startup
/etc/init.d/cron start
/etc/init.d/php5-fpm restart 

# Keep container alive
top -bc
