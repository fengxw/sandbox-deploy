#!/bin/bash

# Startup
/etc/init.d/php7.0-fpm restart 

# Keep container alive
top -bc
