class Album

  attr_reader :title, :year, :rank

  def initialize(title, year, rank)
    @title = title
    @year = year
    @rank = rank
  end

end