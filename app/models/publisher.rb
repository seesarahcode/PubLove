class Publisher < ActiveRecord::Base

	has_many :books
	has_many :imprints
	has_one :admin, class_name: "User", foreign_key: "publisher_id"

	validates :admin_id, presence: true

end
