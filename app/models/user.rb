class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name 
  	# self.name is sayig the specific name for the current user we are talking about
  	# whenever we are instantiating a specific user
  	self.name.split.first
  end

  def last_name
  	self.name.split.last
  end
end
