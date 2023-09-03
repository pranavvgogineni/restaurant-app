has_secure_password
validates :email, presence: true, uniqueness: true
has_many :saved_searches

class User < ApplicationRecord
end
