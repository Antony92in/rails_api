class Book < ApplicationRecord


	has_many :shop_books
	has_many :shops, :through => :shop_books
end
