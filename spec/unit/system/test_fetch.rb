require 'rspec'
module Qrb
  describe System, "fetch" do

    let(:system){ System.new }

    before do
      system.add_type(intType)
    end

    subject{ system.fetch(name) }

    context 'with an existing type name' do
      let(:name){ "intType" }

      it 'should return the type' do
        subject.should eq(intType)
      end
    end

    context 'with a non existing type name and no block' do
      let(:name){ "noSuchOne" }

      it 'should raise an error' do
        ->{
          subject
        }.should raise_error(KeyError, /noSuchOne/)
      end
    end

    context 'with a non existing type name and a block' do
      subject{
        system.fetch("noSuchOne"){ "bar" }
      }

      it 'should yield the block' do
        subject.should eq("bar")
      end
    end

  end
end
