class Load < ApplicationRecord
  belongs_to :user

  validates :amount_loaded, presence: true
  validates :remaining_load, presence: true
end
