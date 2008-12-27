require "#{File.dirname(__FILE__)}/../spec_helper.rb"
describe "IRB" do
  describe "when loading" do
    it "is loaded" do
      $available[:irb].should_not be_nil
    end
    it "is working"
  end
end
