class TaskAssignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :task

	validates :task_id, :user_id, presence: true
end
