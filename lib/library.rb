class Library
  attr_reader :name, :books, :checked_out_books, :check_out_tally, :authors

  def initialize(name)
    @name = name
    @books = []
    @checked_out_books = []
    @check_out_tally = {}
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
      book_checkout_tally(book)
      @checked_out_books << book
      @books.delete(book)
      true
    end
  end

  def return(book)
    @checked_out_books.delete(book)
    @books << book
  end

  def most_popular_book
    @check_out_tally.key(@check_out_tally.values.max)
  end

  def book_checkout_tally(book)
    @check_out_tally[book] ||= 0
    @check_out_tally[book] += 1
  end
end