class Publisher < ActiveRecord::Base

	validates :name, :street, :city, :state, :zip, :phone, presence: true

end
