class User < ActiveRecord::Base
	# roles: super_admin, admin, project_manager, author, team_member
  
  after_create :create_profile
  after_create :create_preferences
  after_create :create_account, if: :is_admin?
  after_create :create_publisher_for_admin, if: :is_admin?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, class_name: "UserProfile", foreign_key: "user_id"
  has_one :preferences, class_name: "Preference", foreign_key: "user_id"
  has_one :publisher, :foreign_key => 'admin_id'
  has_one :account, :foreign_key => 'admin_id'
  has_many :tasks
  has_many :assigned_tasks, :class_name => 'Task', :foreign_key => 'assigned_to'
  has_many :owned_tasks, :class_name => 'Task', :foreign_key => 'assigned_by'
  has_and_belongs_to_many :events, :join_table => "event_attendees"
  has_and_belongs_to_many :books, :join_table => "book_authors", :conditions => { :role => "author" }
  has_and_belongs_to_many :projects, class_name: "Book", :join_table => "book_teams", :conditions => { :role => "project_manager" || "admin"}

  validates :role, presence: true
  validates :publisher_id, presence: true, :unless => lambda { :is_super_admin || :is_admin? }

  def is_super_admin?
  	self.role == "super_admin" ? true : false
  end

  def not_super?
    self.role == "super_admin" ? false : true
  end

  def is_admin?
  	self.role == "admin" ? true : false
  end

  def is_pm?
  	self.role == "project_manager" ? true : false
  end

  def is_author?
  	self.role == "author" ? true : false
  end

  def create_profile
    self.publisher_id.present? ? UserProfile.create(user_id: self.id, publisher_id: self.publisher_id) : UserProfile.create(user_id: self.id)
  end

  def create_preferences
    Preference.create(user_id: self.id)
    # To-do: add default time zone and theme
  end

  def create_account
    account = Account.create(admin_id: self.id)
  end

  def create_publisher_for_admin
    if self.publisher_id.blank?
      pub = Publisher.create(admin_id: self.id)
      self.publisher_id = pub.id
      self.save
    end
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
