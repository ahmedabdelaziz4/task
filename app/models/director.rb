class Director < ApplicationRecord
	has_many :movies
	#validations
	validates_uniqueness_of :name
	validates_presence_of :name,:year
end
