class Author
  attr_reader :first_name, :last_name, :books

  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end
end