class Book < ActiveRecord::Base

	validates :title, presence: true
	validates :pub_year, presence: true

end
