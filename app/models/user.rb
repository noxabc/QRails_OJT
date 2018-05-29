class User < ApplicationRecord
  has_many :trip_transaction
  has_secure_password
  has_secure_token :auth_token
  validates_uniqueness_of :username

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :mobile_number, presence: true

  def invalidate_token
    self.update_columns(auth_token: nil)
  end

  def self.valid_login?(username, password)
    user = find_by(username: username)
    if user && user.authenticate(password)
      user
    end
  end
end
