class Medal < ApplicationRecord
  # include Singleton
  has_and_belongs_to_many :users

  @@medals = Medal.all

  def self.award_medal(user, medal)
    user.medals << @@medals[medal] unless user.medals.include?(@@medals[medal])
  end

end
