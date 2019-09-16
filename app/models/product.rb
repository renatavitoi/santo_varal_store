class Product < ApplicationRecord
	has_many :orders
	has_many :comments

	def self.search(search_term)
		if Rails.env.production? # use "ilike" matching operator for postgres to ignore upper- and lower-case
			Product.where("name ilike ?", "%#{search_term}%")
		else
			Product.where("name LIKE ?", "%#{search_term}%")
		end
   end
	end

def highest_rating_comment
  comments.rating_desc.first
end

def lowest_rating_comment
  comments.rating_desc.first
end
