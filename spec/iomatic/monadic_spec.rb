require 'spec_helper'

describe IOMatic::Monadic do

  class Something
    include IOMatic::Monadic

    def meth1
      1
    end

  end

  context "generic api methods" do

    before :each do
      @thing = Something.new
    end

    it "should default to the generic monadic context" do
      @thing.contextify.class.should eq IOMatic::Monadic::Context
    end


    it "should allow a class mixing in monadic to specify its context" do
      Something.should respond_to :setup_monad
    end

    it "should somehow overcome the weakness with ruby inheritance that makes it so that inherited class do not also inherit a copy of the superclass's static methods" do
      pending
    end

  end 

  describe "context" do
    let(:thing) { Something.new }

    it "should allow a context to return it's pure value" do
      thing.contextify.purify.should eq thing
    end

    it "should allow me to call the methods of the pure value" do
      thing.contextify.meth1.should eq thing.meth1
    end
    
  end

end