class Medal < ApplicationRecord
  has_and_belongs_to_many :users

  @@medals = Medal.all

  def self.award_medal(user, medal)
    user.medals << @@medals[medal] unless user.medals.include?(@@medals[medal])
    self.status = user.medals.map { |medal| medal.points }.reduce(:+)
  end

end
