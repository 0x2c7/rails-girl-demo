#!/bin/bash
bundle exec rake db:migrate && bundle exec puma -p 4000 -C ./config/puma.rb
