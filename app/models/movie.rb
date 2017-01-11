class Movie < ApplicationRecord

	def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
    self.all
  end
end
	#relations
	has_many :casts
	has_many :actors, -> {uniq}, :through => :casts

	has_many :watchlists
	has_many :users, -> {uniq}, :through => :watchlists


	has_many :categories
	has_many :genres, -> {uniq}, :through => :categories

	has_many :reviews


	belongs_to :director, required: false

	#validations
	validates_uniqueness_of :name
	validates_presence_of :name,:year

end
