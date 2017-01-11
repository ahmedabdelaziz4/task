class News < ApplicationRecord
	def self.search(search)
	  if search
	    self.where("content like ?", "%#{search}%")
	  else
	    self.all
	  end
	end
end
