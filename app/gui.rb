module GUI
  GUI_PATH = APP_PATH/'gui'
  def self.load(gui)
    require GUI_PATH/"#{gui.to_s.downcase}.rb"
    send(:irb)
  end
end

GUI.load ARGV[0] || :irb
