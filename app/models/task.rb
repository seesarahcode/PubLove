class Task < ActiveRecord::Base
	belongs_to :user

	validates :book_id, :assigned_to, presence: true
end
