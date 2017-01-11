class Category < ApplicationRecord
	belongs_to :movie
	belongs_to :genre
end
