class ProfilesController < ApplicationController
  def index
  end

  def wallets
    render :text, partial: 'wallets'
  end

  def deposit
    render :text, partial: 'deposit'
  end

  def withdraw
    render :text, partial: 'withdraw'
  end

  def edit
    render :text, partial: 'edit_profile'
  end

  def show_profile
    render :text, partial: 'show_profile'
  end

  def make_deposit
    current_user.score += amount_params[:amount].to_f
    if current_user.save
      flash[:notice] = 'Updated'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to '/profile'
  end

  def make_withdraw
    current_user.score -= amount_params[:amount].to_f
    if current_user.save
      flash[:notice] = 'Updated'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to '/profile'
  end

  def update_profile
    current_user.update_attributes(user_params)
    if current_user.valid?
      flash[:notice] = 'Updated'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to '/profile'
  end

  private

  def user_params
    params[:user].permit!
  end

  def amount_params
    params.permit!
  end
end
