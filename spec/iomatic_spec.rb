require "spec_helper"


Dir[File.join("iomatic", "*_spec.rb")].each { |spec| require spec } 
describe IOMatic do 

  context "Sanity" do
    it "should have viewable" do
      IOMatic::Viewable.should_not be_nil
    end
    it "should have Dispatchable" do
      IOMatic::Dispatchable.should_not be_nil
    end
    it "should have Monadic" do
      IOMatic::Monadic.should_not be_nil
    end
    it "should have Validatable" do
      IOMatic::Validatable.should_not be_nil
    end
  end

end