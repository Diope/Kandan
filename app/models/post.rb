class Post < ActiveRecord::Base
	def self.search(query)
		if query.present?
			where("title like :q", q: "%#{query}%")
		else
			all
		end
	end
end
