class DealsController < ApplicationController
  def index
  end

  def create
    bet = deal_params[:bet].to_f
    deal = Deal.opened.where(bet: bet).first_or_create

    deal.with_lock do
      current_user.bet(bet)
      if deal.first_user_id.blank?
        deal.first_user_id = current_user.id
      else
        deal.second_user_id = current_user.id
        deal.choose_winner
      end
      deal.save
    end
    redirect_to '/deals'
  end

  private

  def deal_params
    params.permit(:bet)
  end
end
