class Session < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  def new
  end

  
end
