require 'spec_helper'
module Qrb
  describe Syntax, "heading" do

    subject{
      Syntax.parse(input, root: "heading")
    }

    describe "compilation result" do
      let(:compiled){
        subject.compile(type_factory)
      }

      context 'empty heading' do
        let(:input){ '  ' }

        it 'compiles to a Heading' do
          compiled.should be_a(Heading)
          compiled.to_name.should eq('')
        end
      end

      context 'a: .Integer' do
        let(:input){ 'a: .Integer' }

        it 'compiles to a Heading' do
          compiled.should be_a(Heading)
          compiled.to_name.should eq('a: Integer')
        end
      end

      context 'a: .Integer, b: .Float' do
        let(:input){ 'a: .Integer, b: .Float' }

        it 'compiles to a Heading' do
          compiled.should be_a(Heading)
          compiled.to_name.should eq('a: Integer, b: Float')
        end
      end
    end

    describe "AST" do
      let(:input){ 'a: .Integer, b: .Float' }

      let(:ast){
        subject.to_ast
      }

      it{
        ast.should eq([
          :heading,
          [ :attribute, "a", [:builtin_type, "Integer" ]],
          [ :attribute, "b", [:builtin_type, "Float" ]]
        ])
      }
    end
  end
end
