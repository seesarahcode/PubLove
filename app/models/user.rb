class User < ActiveRecord::Base
	# roles: super_admin, admin, project_manager, author

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

end
