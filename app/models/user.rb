class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :first_deals, :class_name => 'Deal', :foreign_key => 'first_user_id'
  has_many :second_deals, :class_name => 'Deal', :foreign_key => 'second_user_id'


  def deals
    self.first_deals + self.second_deals
  end

  def bet(val)
    self.score -= val
    save
  end

  def win(val)
    self.score += val
    save
  end

  def withdraw(val)
    self.score -= val
    save
  end

  def deposit(val)
    self.score += val
    save
  end

  private

  def winned_deals
    deals.where(winner: self.id)
  end
end
