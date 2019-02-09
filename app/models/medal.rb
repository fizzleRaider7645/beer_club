class Medal < ApplicationRecord
  # include Singleton
  has_and_belongs_to_many :users
end
