class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, :inclusion => { :in => 0..5 }
  accepts_nested_attributes_for :beer


  def beers=(beer_attributes)
    beer = Beer.find_by(name: beer_attributes[:name])
    beer ||= beer = Beer.create(beer_attributes)
    self.beer = beer
  end

end
