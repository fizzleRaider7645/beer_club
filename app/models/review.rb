class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, :inclusion => { :in => 0..5 }
  accepts_nested_attributes_for :beer


  def beer_attributes=(beer_attributes)
    update_by_id if beer_attributes.include?(:id)
    beer = Beer.find_by(name: beer_attributes[:name])
    update_by_name(beer, beer_attributes) if beer
    beer = Beer.create(beer_attributes)
    self.beer = beer
  end

  private

  def update_by_id(beer_attributes)
    beer = Beer.find_by(id: beer_attributes[:id])
    beer.update(beer_attributes)
    self.beer = beer
    return
  end

  def update_by_name(beer, beer_attributes)
    beer.update(beer_attributes)
    self.beer = beer
    return
  end
end
