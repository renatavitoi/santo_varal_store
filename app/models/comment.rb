class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

# <%= @product.comments.order(rating: :desc).first %>
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_desc, -> { order(rating: :asc) }
end
