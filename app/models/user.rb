class User < ApplicationRecord
  has_secure_password
  has_many :sessions
  has_many :beers, through: :sessions
  has_and_belongs_to_many :medals


  def award_first_medal
    self.medals << Medal.all.first
  end
end
