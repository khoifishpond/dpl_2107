require './lib/author'
require './lib/book'
require 'rspec'

describe Author do
  context 'Attributes' do
    before(:each) do
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
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

  context 'Behvaiors' do
    before(:each) do
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    end

    it 'can write books' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      
      expect(jane_eyre).to be_a(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")

      villette = @charlotte_bronte.write("Villette", "1853")

      expect(villette).to be_a(Book)
      expect(villette.title).to eq("Villette")
      expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end