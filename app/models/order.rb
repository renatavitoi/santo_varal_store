class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
end
