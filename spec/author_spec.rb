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
  end
end