class BalanceLoad < ApplicationRecord
  belongs_to :HistoryLoad :user

  validates :amount_loaded, presence: true
  validates :remaining_load, presence: true
end
