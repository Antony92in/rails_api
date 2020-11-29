class Publisher < ApplicationRecord
	has_many :shop_books
	has_many :books, :through => :shop_books
	has_many :shops, :through => :shop_books
end
