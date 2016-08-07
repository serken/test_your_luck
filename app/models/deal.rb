class Deal < ActiveRecord::Base
  belongs_to :first_user, class_name: 'User', foreign_key: 'first_user_id'
  belongs_to :second_user, class_name: 'User', foreign_key: 'second_user_id'
  belongs_to :winner, class_name: 'User', foreign_key: 'winner'
  scope :opened, -> { where(state: 'open') }
  scope :closed, -> { where(state: 'closed') }

  before_create :open_a_deal

  def choose_winner
    self.winner = [self.first_user_id, self.second_user_id].get(Random.rand(2))
    self.state = 'closed'
  end

  def first_user
    User.find(first_user_id)
  end

  def second_user
    User.find(second_user_id)
  end

  private

  def open_a_deal
    self.state = 'open'
  end
end
