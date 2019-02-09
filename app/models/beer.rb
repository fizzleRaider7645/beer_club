class Beer < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
end
