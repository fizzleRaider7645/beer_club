class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, :inclusion => { :in => 0..5 }
  accepts_nested_attributes_for :beer


  def beer_attributes=(beer_attributes)
    if beer_attributes.include?(:id)
      beer = Beer.find_by(id: beer_attributes[:id])
      beer.update(beer_attributes)
    else
      beer = Beer.create(beer_attributes.delete(:id))
      self.beer = beer
    end
  end

end
