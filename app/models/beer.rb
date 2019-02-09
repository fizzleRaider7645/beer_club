class Beer < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
  scope :new_to_beer_club, -> { where('created_at > ?', Time.current - 1.month) }
end
