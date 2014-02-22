require 'spec_helper'
module Qrb
  describe BuiltinType, "from_q" do

    let(:type){ BuiltinType.new(Integer, 'int') }

    subject{ type.from_q(arg) }

    context 'with an Integer' do
      let(:arg){ 12 }

      it{ should be(arg) }
    end

    context 'with a Float' do
      let(:arg){ 12.0 }

      subject{
        type.from_q(arg) rescue $!
      }

      it 'should raise an Error' do
        subject.should be_a(TypeError)
        subject.message.should eq("Invalid value `12.0` for int")
      end

      it 'should have no location' do
        subject.location.should eq('')
      end
    end

  end
end
