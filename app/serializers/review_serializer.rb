class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :date
  belongs_to :beer
  belongs_to :user
end
