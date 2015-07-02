class Publisher < ActiveRecord::Base

	has_many :books

	validates :name, :street, :city, :state, :zip, :phone, presence: true

end
