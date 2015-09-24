class Account < ActiveRecord::Base
	belongs_to :user
	validates :admin_id, presence: true
end
