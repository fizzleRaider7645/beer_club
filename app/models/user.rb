class User < ApplicationRecord
  has_secure_password
  has_many :sessions
  has_many :beers, through: :sessions
  has_and_belongs_to_many :medals


  def award_rookie_medal?
    if self.beers.count >= 1
      Medal.award_medal(self, 0)
    else
      return
    end
  end

  def award_well_traveled_medal?
    if self.beers.map { |beer| beer.country }.uniq.count >= 2
      Medal.award_medal(self, 1)
    else
      return
    end
  end
end
