class ShopBook < ApplicationRecord
	belongs_to :book
	belongs_to :shop
	belongs_to :publisher
end
