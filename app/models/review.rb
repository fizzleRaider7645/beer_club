class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, :inclusion => { :in => 0..5 }
  accepts_nested_attributes_for :beer


  def beer_attributes=(beer_attributes)
    if beer_attributes.include?(:id)
      beer = Beer.find_by(id: beer_attributes[:id])
      beer.update(beer_attributes)
      return
    end

    beer = Beer.find_by(name: beer_attributes[:name])

    if beer
      beer.update(beer_attributes)
      return
    end
    beer_attributes.delete(:id)
    beer = Beer.create(beer_attributes)
    self.beer = beer
  end

  private
end
