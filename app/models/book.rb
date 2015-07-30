class Book < ActiveRecord::Base

	belongs_to :publisher
	has_many :team_members, class_name: "BookTeam", foreign_key: "book_id"
	has_many :book_authors
	has_and_belongs_to_many :authors, :class_name => 'User', :join_table => "book_authors"
	
	validates :title, :pub_year, :publisher_id, presence: true

end
