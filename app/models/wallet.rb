class Wallet < ActiveRecord::Base
  has_one :user

  TYPES = %w(PerfectMoney OkPay Payeer)

  def make_deposit
  end

  def make_withdraw
  end
end
