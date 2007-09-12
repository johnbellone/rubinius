require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Kernel.Float" do
  it "should call to_f to convert any arbitrary argument to a Float" do
    class KernelSpecFloat
      def to_f; 1.1; end
    end

    Float(KernelSpecFloat.new).should == 1.1
  end

  version :not, '1.8.4'..'1.8.5' do
    it "should call to_i to convert any arbitrary argument to a Float" do
     class KernelSpecFloat2
       def to_i; 7; end
     end

     Float(KernelSpecFloat2.new).should == 7.0
    end
  end

  it "should give to_f precedence over to_i" do
    class KernelSpecFloat3
      def to_i; 7; end
      def to_f; 69.9; end
    end

    Float(KernelSpecFloat3.new).should == 69.9
  end

  it "should raise a TypeError if there is no to_f or to_i method on an object" do
    class KernelSpecFloat4; end

    should_raise(TypeError) { Float(KernelSpecFloat4.new) }
  end

  it "should raise a TypeError if to_f doesn't return a Float" do
    class KernelSpecFloat5
      def to_f; 'har'; end
    end

    should_raise(TypeError) { Float(KernelSpecFloat5.new) }  
  end
  
  version '1.8.4'..'1.8.5' do
    it "raises ArgumentError if passed a string that cannot be fully converted to a Float" do
      should_raise(ArgumentError) { Float('float') }
    end
  end
  
  version '1.8.6' do
    it "raises TypeError if passed a string that cannot be fully converted to a Float" do
      should_raise(TypeError) { Float('float') }
    end
  end
end
