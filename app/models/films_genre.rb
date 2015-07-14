class FilmsGenre < ActiveRecord::Base
  belongs_to :film
  belongs_to :genre

  def review_score
    
  end
end