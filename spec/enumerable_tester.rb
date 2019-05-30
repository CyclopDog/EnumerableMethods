require '../lib/enumerable'

RSpec.describe Enumerable do
    describe "#each" do
      it "returns each argument" do
        expect([1,2,3,4,5].my_each { |i| i }).to eql([1,2,3,4,5])
      end
    end
  end