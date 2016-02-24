class User < ActiveRecord::Base
  has_secure_password
  has_many :locations

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true}, format: { with: /@/ }

end
