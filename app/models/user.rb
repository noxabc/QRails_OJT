class User < ApplicationRecord
  has_many :trip_transactions
  has_secure_password
  has_secure_token :auth_token
  validates_uniqueness_of :username

  validates :last_name, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :middle_name, presence: true, length: { maximum: 15 }
  validates :username, presence: true, length: { maximum: 15 }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :mobile_number, presence: true, length: { maximum: 11 }

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
