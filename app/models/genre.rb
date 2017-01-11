class Genre < ApplicationRecord
	has_many :categories
	has_many :movies, -> {uniq}, :through => :categories
	#validations
	validates_uniqueness_of :name
	validates_presence_of :name

end
