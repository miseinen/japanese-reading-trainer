#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/dictionary'
require_relative 'lib/game'
require_relative 'lib/path_controller'

APP_ROOT = File.dirname(__FILE__)

path_settings = 'path_settings.txt'

path_cli_argument = ARGV[0]

path = PathController.new(path_settings, path_cli_argument).path

loop do
  Game.new(Dictionary.new(path)).play
end
