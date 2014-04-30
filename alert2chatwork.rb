#!/usr/local/bin/ruby
require 'yaml'
require 'bundler'

ENV['BUNDLE_GEMFILE'] = File.expand_path(File.join(File.dirname($0), 'Gemfile'))
Bundler.require

current_directory = File.expand_path(File.dirname(__FILE__))
require File.join(current_directory, 'lib/watcher.rb')
require File.join(current_directory, 'lib/alerter.rb')

watcher = Watcher.new(File.join(current_directory, 'list.yml'))
messages = watcher.watch

alerter = Alerter.new(File.join(current_directory, 'config.yml'))
alerter.alert messages
