require './lib/author'
require 'rspec'

describe Author do
  context 'Attributes' do
    before(:each) do
      @charlotte_bronte = Author.new(
        {
          first_name: "Charlotte",
          last_name: "Bronte"
        }
      )
    end

    it 'exists' do
      expect(@charlotte_bronte).to be_a(Author)
    end

    it 'has a name' do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'starts with no books' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end
end