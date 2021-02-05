class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :body, :rating

  validates :user_id, uniqueness: { scope: :product_id, message: "You've already made a comment!" }
end
