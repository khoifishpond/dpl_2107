require './lib/library'
require './lib/author'
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

    it 'starts with no authors' do
      expect(@dpl.authors).to eq([])
    end
  end

  context 'Behaviors' do
    before(:each) do
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    end

    it 'can add authors' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end

    it "can determine the time frame of authors' books" do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({start: "1847", end: "1857"})
      expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({start: "1960", end: "1960"})
    end

    it "can find the publication years for an author's books" do
      expect(@dpl.publication_years_for(@charlotte_bronte)).to eq(["1847", "1857", "1853"])
    end

    it 'cannot checkout books that do not exist in the library' do
      expect(@dpl.checkout(@mockingbird)).to eq(false)
      expect(@dpl.checkout(@jane_eyre)).to eq(false)
    end
  end
end