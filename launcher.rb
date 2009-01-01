#!/usr/bin/ruby
# See License for more informations about the license.
# Created by Othmane Benkirane (rhyhann).
# www.thysteo.com

# These requires are needed between here and the library require
# TODO: move String#/ to a specific file
require File.join(File.dirname(__FILE__), 'lib', 'ruby_extensions.rb')
require File.join(File.dirname(__FILE__), 'lib', 'logger.rb')
l "loading gems", 1 do
  %w(
     rubygems yaml
     dm-core  gecoder
    ).each {|gem| l("loading #{gem}", 2){require gem}}
end
l "setting global things", 1 do
  PATH = File.dirname(__FILE__)
  APP_PATH = PATH/:app
  LIB_PATH = PATH/:lib
  CONFIG = YAML.load_file(PATH/'config.yml')
end
l "loading local librairies", 1 do
  Dir.glob("#{PATH}/lib/**/*.rb").each {|file| l("loading #{file}", 2){require file}}
end
l "loading application", 1 do
  l("requiring files", 2)
  Dir.glob(APP_PATH+'/*.rb').each {|f| log "requiring #{f}", 3; require f }
  gui_to_load = ARGV[0] || CONFIG[:gui]
  l("Loading #{gui_to_load} gui", 2) {GUI.load gui_to_load}
end
