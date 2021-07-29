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

    it 'has a name' do
      expect(@dpl.name).to eq("Denver Public Library")
    end

    it 'starts with no books' do
      expect(@dpl.books).to eq([])
    end
  end
end