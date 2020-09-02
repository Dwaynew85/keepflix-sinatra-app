require 'nokogiri'
require 'open-uri'
class Scraper

  def self.scrape_movie(link)
    movie_details = {}
    mov = Nokogiri::HTML(open(link))
    # binding.pry
    movie_details[:title] = mov.css(".title_wrapper h1").children.first.text
    stars = mov.css(".credit_summary_item").last.css("a").children.collect {|star| star.text}
    stars.pop if stars.last.include?("See full cast")
    movie_details[:stars] = stars
    movie_details[:genres] = mov.css(".subtext a").map {|genre| genre.text unless genre.text =~ /\d/}.compact
    movie_details[:rating] = mov.css(".subtext").children.first.text.strip
    movie_details[:runtime] = mov.css(".subtext time").text.strip
    movie_details[:release_date] = mov.css(".subtext a").last.text.strip
    movie_details[:summary] = mov.css(".summary_text").text.strip
    movie_details[:image_url] = mov.css(".poster img").attribute("src").value if !mov.css(".poster img").empty?
    unless mov.css(".slate a").first == nil
      movie_details[:trailer_link] = "https://www.imdb.com/" + mov.css(".slate a").first.attributes["href"].value
    else
      movie_details[:trailer_link] = "No Trailer Available"
    end
    movie_details[:link] = link
    movie_details
  end
end
