class BookTeam < ActiveRecord::Base
	belongs_to :book

	validates :book_id, :user_id, 	presence: true
end
