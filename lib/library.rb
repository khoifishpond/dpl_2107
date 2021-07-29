class Library
  attr_reader :name, :books, :checked_out_books, :authors

  def initialize(name)
    @name = name
    @books = []
    @checked_out_books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    publication_time_fame = {}
    publication_time_fame[:start] = publication_years_for(author).sort.min
    publication_time_fame[:end] = publication_years_for(author).sort.max
    publication_time_fame
  end

  def publication_years_for(author)
    author.books.map do |book|
      book.publication_year
    end
  end

  def checkout(book)
    if @checked_out_books.include?(book) || !@books.include?(book)
      false
    else
      @checked_out_books << book
      @books.delete(book)
      true
    end
  end
end