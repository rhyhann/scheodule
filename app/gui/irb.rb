# IRB Interface

module GUI::IRB
  def self.launch
    require 'irb'
    ::IRB.start
  end
end


module GUI
  def self.irb
    GUI::IRB::launch
  end
end
