class Movie < ActiveRecord::Base
  belongs_to :user

  def self.create_from_scrape(link)
    movie = Scraper.scrape_movie(link)
    self.find_or_create_by(movie)
  end
end
