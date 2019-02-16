class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  scope :new_to_beer_club, -> { where('created_at > ?', Time.current - 1.month) }
  validates :name, presence: true


  def rating
    reviews = Review.all.select { |review| review.beer.name == self.name }
    ratings = reviews.map { |review| review.rating }
    sum = ratings.reduce(:+)
    sum / reviews.count
  end
end
