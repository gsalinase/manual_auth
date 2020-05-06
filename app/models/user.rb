class User < ApplicationRecord
  has_many :stories
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
