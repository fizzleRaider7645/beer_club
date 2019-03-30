class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  scope :new_to_beer_club, -> { where('created_at > ?', Time.current - 1.month) }
  validates :name, presence: true


  def rating
    return "Not Yet Reviewed" if self.reviews.count == 0
    reviews = self.reviews
    ratings = reviews.map { |review| review.rating }
    sum = ratings.reduce(:+)
    '%.2f' % "#{sum / reviews.count}"
  end
end
