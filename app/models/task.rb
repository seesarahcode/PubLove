class Task < ActiveRecord::Base
	validates :book_id, :assigned_by, presence: true
end
