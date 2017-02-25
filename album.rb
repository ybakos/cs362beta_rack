class Album
  attr_accessor :rank, :title, :year, :title_length

  def initialize(rank, title, year)
    raise ArgumentError.new("Invalid rank") if rank < 1
    raise ArgumentError.new("Invalid rank") if rank > 100

    @rank = rank
    @title = title
    @year = year
    @title_length = get_title_length(@title)
  end

  def get_title_length(title)
    title.size
  end

end

