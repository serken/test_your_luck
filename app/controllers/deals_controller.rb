class DealsController < ApplicationController
  def index
    @closed_deals = Deal.includes(:first_user).includes(:second_user).closed
    @opened_deals = Deal.includes(:first_user).opened
  end

  def new
  end

  def accept_deal
    deal = Deal.find(params[:deal_id])
    deal.with_lock do
      raise 'You can not make a deal with yourself' if current_user.id == deal.first_user_id

      current_user.bet(deal.bet)
      deal.second_user_id = current_user.id
      deal.choose_winner
      deal.save
    end
    redirect_to deals_path
  end

  def create
    bet = deal_params[:bet].to_f
    deal = Deal.opened.where(bet: bet).where.not(first_user_id: current_user.id).first_or_initialize
    current_user.with_lock do
      raise 'You can not make a deal with yourself' if current_user.id == deal.first_user_id

      current_user.bet(bet)

      deal.with_lock do
        if deal.first_user.blank?
          deal.first_user = current_user
        else
          deal.second_user = current_user
          deal.choose_winner
        end
        deal.save
      end
    end
    redirect_to deals_path
  end

  private

  def deal_params
    params.permit(:bet)
  end
end
