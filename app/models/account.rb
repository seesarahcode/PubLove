class Account < ActiveRecord::Base
	validates :admin_id, presence: true
end
