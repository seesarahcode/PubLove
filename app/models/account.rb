class Account < ActiveRecord::Base
	validates :admin_id, :plan, presence: true
end
