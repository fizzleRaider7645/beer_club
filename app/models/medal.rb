class Medal < ApplicationRecord
  # include Singleton
  has_and_belongs_to_many :users

  @@medals = {
    :first => Medal.all[1],
    :second => Medal.all[2],
    :third => Medal.all[3]
  }

  def self.up_for_a_medal?(user)
    return @@medals[:first] if first_medal(user)
    return @@medals[:second] if second_medal(user)
    return @@medals[:third] if third_medal(user)
  end


  private

  def not_yet_awarded(user, medal)
    !user.medals.include(medal)
  end

  def first_medal(user)
    true if user.beers.count >= 1 && not_yet_awarded(user, @@medals[:first])
  end

  def second_medal(user)
    true if user.beers.map { |beer| beer.country }.uniq.count >= 5 && not_yet_awarded(user,
      @@medals[:second])
  end

  def third_medal(user)
    true if user.beers.map { |beer| beer.country }.uniq.count >= 10 && not_yet_awarded(user,
      @@medals[:third])
  end
end
