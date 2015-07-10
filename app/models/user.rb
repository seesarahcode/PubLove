class User < ActiveRecord::Base
	# roles: super_admin, admin, project_manager, author
  
  after_create :create_profile
  after_create :create_publisher_for_admin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, class_name: "UserProfile", foreign_key: "user_id"

  validates :role, presence: true

  def is_super_admin?
  	self.role == "super_admin" ? true : false
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

  def create_publisher_for_admin
    if role == "admin" && publisher_id.blank?
      pub = Publisher.create(admin_id: self.id)
      self.publisher_id = pub.id
      self.save
    end
  end

end
