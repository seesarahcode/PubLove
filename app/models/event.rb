class Event < ActiveRecord::Base
	has_and_belongs_to_many :attendees, :class_name => "User", :join_table => "event_attendees"

	validates :event_type, :date, :time, :title, presence: true
end
