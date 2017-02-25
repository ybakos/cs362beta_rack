class Album
  attr_accessor :rank, :title, :year

  def initialize(rank, title, year)
    @rank = rank
    @title = title
    @year = year
    @title_length = get_title_length(@title)
  end

  def get_title_length(title)
    title.size
  end

end

