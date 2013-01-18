require "spec_helper"

class ValidatableTest
  include IOMatic::Validatable
end

describe IOMatic::Validatable do

  describe "class-level included api" do
    subject { ValidatableTest }

    specify { should respond_to :setup_validator }
  end

  describe "instance-level included api" do
    subject { ValidatableTest.new }

    specify { should respond_to :valid? }

    specify { should respond_to :errors }
  end

  describe "default validator" do
    class ValidatableTest
      setup_validator IOMatic::Validatable::Validator.new
    end

    let(:test) { ValidatableTest.new }

    it "should always be valid in the default implementation" do
      test.should be_valid
    end

    it "should always return an empty errors array" do
      test.errors.should be_empty
    end
  end

  describe "bare minimal validator" do
    before :each do
      
      ValidatableTest.setup_validator lambda { |object| [] }
    end
    let(:test) { ValidatableTest.new }
    it "should always be valid in the default implementation" do
      test.should be_valid
    end

    it "should always return an empty errors array" do
      test.errors.should be_empty
    end
  end

end