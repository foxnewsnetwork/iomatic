require "spec_helper"

describe IOMatic::Dispatchable do

  class ViewDispatcher
    def call object
      object
    end
  end

  class Dog
    include IOMatic::Dispatchable

    connect_external ViewDispatcher.new
  end

  class EmailDispatcher < IOMatic::Dispatchable::Dispatcher

  end

  class Cat
    include IOMatic::Dispatchable

    connect_external EmailDispatcher.new
  end

  context "public mixin api" do

    before :each do
      @fluffy = Dog.new
      @edward = Cat.new
    end

    it "should allow dispatchables to make dispatches" do
      @fluffy.dispatch.should eq @fluffy
      @edward.dispatch.should eq @edward
    end

  end

end