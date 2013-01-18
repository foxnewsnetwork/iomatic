require "spec_helper"

describe IOMatic::Viewable do

  class Monster < IOMatic::Viewable::Renderer; end 

  class Foo
    include IOMatic::Viewable

    setup_renderer Monster.new
  end

  context "public mixin api" do

    before :each do
      @bar = Foo.new
      @monster = Monster.new
    end

    it "should respond to to_s" do
      @monster.should respond_to :to_s
    end

    [:render].each do |method|
      it "should respond to #{method}" do
        @bar.should respond_to method
      end
    end

    it "should have the default implemenation of return a string" do
      @bar.render.should be_is_a String
    end

  end

end