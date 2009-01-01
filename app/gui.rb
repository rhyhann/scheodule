module GUI
  GUI_PATH = APP_PATH/'gui'
  def self.load(gui)
    log "requiring #{gui} file", 3
    require GUI_PATH/"#{gui.to_s.downcase}.rb"
    log "launching gui", 3
    send gui
  end
end
