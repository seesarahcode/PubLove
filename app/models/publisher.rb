class Publisher < ActiveRecord::Base

	has_many :employees, class_name: "User", foreign_key: "publisher_id"
	has_one :admin, class_name: "User", foreign_key: "publisher_id"
	
	has_many :books
	has_many :imprints
	has_many :team_roles

	validates :admin_id, presence: true

end
