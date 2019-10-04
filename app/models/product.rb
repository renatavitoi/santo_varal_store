class Product < ApplicationRecord
	has_many :orders
	has_many :comments

  validates :name, presence: true #Adds validation to the Product model。
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :image_url, presence: true
  validates :colour, presence: true 
  validates :description, presence: true
  validates :price, presence: true
  validates :rating, numericality: { only_integer: true }



	def self.search(search_term)
		if Rails.env.production? # use "ilike" matching operator for postgres to ignore upper- and lower-case
			Product.where("name ilike ?", "%#{search_term}%")
		else
			Product.where("name LIKE ?", "%#{search_term}%")
		end
   end

	 def highest_rating_comment
       comments.rating_desc.first
	end

  def lowest_rating_comment
      comments.rating_asc.first
  end

	def average_rating
		  comments.average(:rating).to_f
	end
end
