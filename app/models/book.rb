class Book < ActiveRecord::Base

	belongs_to :publisher
	has_many :team_members, class_name: "BookTeam", foreign_key: "book_id"
	has_many :book_authors
	has_many :authors, :class_name => 'BookAuthor', :foreign_key => 'book_id'

	validates :title, :pub_year, :publisher_id, presence: true

end
