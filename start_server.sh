#!/bin/bash
SERVER_PORT=${PORT:-80}
bundle exec rake db:migrate && bundle exec puma -p $SERVER_PORT -C ./config/puma.rb
