require './lib/library'
require 'rspec'

describe Library do
  context 'Attributes' do
    before(:each) do
      @library = Library.new("Denver Public Library")
    end
    
    it 'exists' do
      expect(@library).to be_a(Library)
    end
  end
end