class Publisher < ActiveRecord::Base

	has_many :books
	has_one :admin, class_name: "User", foreign_key: "publisher_id"


	validates :admin_id, :name, :street, :city, :state, :zip, :phone, presence: true

end
