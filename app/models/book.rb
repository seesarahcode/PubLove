class Book < ActiveRecord::Base

	belongs_to :publisher

	has_and_belongs_to_many :team_members, class_name: "User", join_table: "book_teams"
	has_many :book_authors
	has_and_belongs_to_many :authors, class_name: 'User', join_table: "book_authors"


	validates :title, :pub_year, :publisher_id, presence: true

end
