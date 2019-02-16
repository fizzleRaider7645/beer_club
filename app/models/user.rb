class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :beers, through: :reviews
  has_and_belongs_to_many :medals
  validates :username, presence: true, uniqueness: true


  def medal_check
    award_rookie_medal?
    award_well_traveled_medal?
    award_boozy_medal?
    award_connoisseur_medal?
    award_here_gose_nothing_medal?
  end

  private

  def award_rookie_medal?
    if self.beers.count >= 1
      Medal.award_medal(self, 0)
    else
      return
    end
  end

  def award_well_traveled_medal?
    if self.beers.map { |beer| beer.country }.uniq.count >= 5
      Medal.award_medal(self, 1)
    else
      return
    end
  end

  def award_boozy_medal?
    if self.beers.any? { |beer| beer.abv > 12 }
      Medal.award_medal(self, 2)
    else
      return
    end
  end

  def award_connoisseur_medal?
    if self.beers.map { |beer| beer.style }.uniq.count >= 5
      Medal.award_medal(self, 3)
    else
      return
    end
  end


  def award_here_gose_nothing_medal?
    if self.beers.count { |beer| beer.style == "Gose" } >= 5
      Medal.award_medal(self, 4)
    else
      return
    end
  end
end
