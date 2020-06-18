class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 1 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }
end
