require './lib/library'
require 'rspec'

describe Library do
  context 'Attributes' do
    before(:each) do
      @dpl = Library.new("Denver Public Library")
    end
    
    it 'exists' do
      expect(@dpl).to be_a(Library)
    end
  end
end