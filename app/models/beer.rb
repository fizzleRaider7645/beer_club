class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  scope :new_to_beer_club, -> { where('created_at > ?', Time.current - 1.month) }
end
