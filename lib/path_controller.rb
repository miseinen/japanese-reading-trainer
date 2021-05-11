# frozen_string_literal: true

class PathController
  attr_reader :path

  def initialize(settings, cli_argument)
    check_path_settings(settings, cli_argument)
    @path = get_path(settings, cli_argument)
  end

  private

  def check_path_settings(settings, cli_argument)
    no_path = File.size(settings).zero? && cli_argument.nil?
    raise(ArgumentError, 'Path argument required', caller) if no_path
  end

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
end
