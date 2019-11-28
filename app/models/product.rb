class Product < ApplicationRecord
	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy

  validates :name, presence: true #Adds validation to the Product model。
	validates :description, presence: true
	validates :name, presence: true
	validates :colour, presence: true
	validates :price, presence: true

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
