class DealsController < ApplicationController
  def index
    @closed_deals = Deal.closed
    @opened_deals = Deal.opened
  end

  def new
  end

  def accept_deal
    deal = Deal.find(params[:deal_id])
    deal.with_lock do
      current_user.bet(deal.bet)
      deal.second_user_id = current_user.id
      deal.choose_winner
      deal.save
    end
    redirect_to deals_path
  end

  def create
    bet = deal_params[:bet].to_f
    current_user.bet(bet)
    deal = Deal.opened.where(bet: bet).first_or_initialize

    deal.with_lock do
      if deal.first_user_id.blank?
        deal.first_user_id = current_user.id
      else
        deal.second_user_id = current_user.id
        deal.choose_winner
      end
      deal.save
    end
    redirect_to deals_path
  end

  private

  def deal_params
    params.permit(:bet)
  end
end
