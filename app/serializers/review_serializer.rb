class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :date, :rating
  belongs_to :beer
  belongs_to :user
end
