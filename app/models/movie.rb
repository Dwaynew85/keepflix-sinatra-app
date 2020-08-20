class Movie < ActiveRecord::Base
  belongs_to :user

  def self.create_from_scrape(link)
    movie = Scraper.scrape_movie(link)
    self.create(movie)
  end
end
