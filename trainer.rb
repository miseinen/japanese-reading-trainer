#!/usr/bin/env ruby
# frozen_string_literal: true

APP_ROOT = File.dirname(__FILE__)

@path_settings = 'path_settings.txt'

@path_argument = ARGV[0]

def no_path
  File.size(@path_settings).zero? && @path_argument.nil?
end

raise(ArgumentError, 'Path argument required', caller) if no_path

def get_path(settings, cli_argument)
  path = ''

  if !cli_argument.nil?
    File.write(settings, cli_argument)
    path = cli_argument.strip
  else
    file = File.open(settings, 'r')
    path = File.read(file).strip
    file.close
  end
  path
end

get_path(@path_settings, @path_argument)

