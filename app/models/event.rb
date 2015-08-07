class Event < ActiveRecord::Base
	validates :event_type, :date, :time, :title, presence: true
end
