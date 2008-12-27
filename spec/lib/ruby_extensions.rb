# I know it's idiot
require LIB_PATH/'ruby_extensions.rb'
describe "String" do
  describe "when loaded" do
    it "should creates paths" do
      path = File.join(File.dirname(__FILE__) + "../spec_helper.rb")
      path.should == __FILE__/"../spec_helper.rb"
    end
  end
end
