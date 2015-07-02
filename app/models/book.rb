class Book < ActiveRecord::Base

	belongs_to :publisher

	validates :title, :pub_year, :publisher_id, presence: true

end
