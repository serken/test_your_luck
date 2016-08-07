class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :first_deals, :class_name => 'Deal', :foreign_key => 'first_user_id'
  has_many :second_deals, :class_name => 'Deal', :foreign_key => 'second_user_id'

  def deals
    first_deals + second_deals
  end
end
