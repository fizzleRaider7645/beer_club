class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :rating, presence: true, :inclusion => { :in => 0..5 }
  validates :title, presence: true
  accepts_nested_attributes_for :beer


  def beer_attributes=(beer_attributes)
    update_by_id(beer_attributes) if beer_attributes.include?(:id)
    if beer = Beer.find_by(name: beer_attributes[:name])
      self.beer = beer
    else
      beer = Beer.create(beer_attributes)
      self.beer = beer
    end
  end

  private

  def update_by_id(beer_attributes)
    beer = Beer.find_by(id: beer_attributes[:id])
    beer.update(beer_attributes)
    self.beer = beer
    return
  end
end
