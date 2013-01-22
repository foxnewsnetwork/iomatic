require 'spec_helper'

describe IOMatic::Monadic do

  class Something
    include IOMatic::Monadic
    attr_accessor :value
    def meth1
      1
    end

  end

  describe "static api" do
    it "should provide someway of establishing a zero" do
      Something.should respond_to :define_zero
    end

    it "should provide some way of setting the appropriate context" do
      Something.should respond_to :setup_monad
    end

    describe "contextify" do
      let(:object) { Something.new }

      it "should return a context" do
        Something.contextify(object).should be_a IOMatic::Monadic::Context
      end
    end

    describe :define_zero do
      before :each do
        Something.define_zero do
          a = Something.new
          a.value = 0
          a
        end
      end
      let(:zero) { Something.contextify }

      it "should be the zero context" do 
        zero.value.should eq 0
      end

      it "should be a context" do
        zero.should be_a IOMatic::Monadic::Context
      end

      it "should provide a flag to indictate it's zero" do
        zero.should be_nothing
      end
    end # define_zero
  end # static api

  describe "inheritance" do
    class Faggot < IOMatic::Monadic::Context; end
    class Bats < Something
      setup_monad Faggot
    end

    let(:faggot) { Bats.new }
    let(:thing) { Something.new }

    it "should contextify to what was setup" do
      faggot.contextify.should be_a Faggot
    end

    it "should not have changed the parent class's context" do
      thing.contextify.should be_a IOMatic::Monadic::Context
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

  describe "static liftM" do

    let(:thing) { Something }

    it "should respond to liftM" do
      thing.should respond_to :liftM
    end

    it "should lift without a block" do
      thing.liftM(thing.new.contextify).should be_a IOMatic::Monadic::Context
    end

    it "should lift with a block and apply a transform" do
      thing.liftM(thing.new.contextify) do |a|
        a.should be_a Something
        a
      end.should be_a IOMatic::Monadic::Context
    end

  end # liftM

end 