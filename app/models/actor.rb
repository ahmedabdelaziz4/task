class Actor < ApplicationRecord
	#relations
	has_many :casts
	has_many :movies ,-> {uniq}, :through => :casts

	#methods
	def self.search(search)
		if search
		self.where("name like ?", "%#{search}%")
		else
		self.all
		end
	end
	#validations
	validates_uniqueness_of :name
	validates_presence_of :name,:year

	
end
