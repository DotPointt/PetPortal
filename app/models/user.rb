class User < ApplicationRecord
  
  has_secure_password

  has_many :ProjectMembership
  has_many :Project, through: :ProjectMembership

  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true

end
