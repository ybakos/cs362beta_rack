class Album
  attr_accessor :rank, :title, :year, :title_length

  def initialize(rank, title, year)
    raise ArgumentError.new("Invalid rank") if rank < 1
    raise ArgumentError.new("Invalid rank") if rank > 100
    raise ArgumentError.new("Invalid year") if year.to_i < 1
    raise ArgumentError.new("Invalid year") if year.to_i > 2017
    raise ArgumentError.new("Empty title") if title.empty?

    @rank = rank
    @title = title
    @year = year
    @title_length = get_title_length(@title)
  end

  def get_title_length(title)
    title.size
  end

end

