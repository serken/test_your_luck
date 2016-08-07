class ProfilesController < ApplicationController
  def index
  end

  def make_deposit
    if current_user.deposit amount_params[:amount].to_f
      flash[:notice] = 'Updated'
    else
      flash[:error] = 'Something went wrong'
    end
  end

  def make_withdraw
    if current_user.withdraw amount_params[:amount].to_f
      flash[:notice] = 'Updated'
    else
      flash[:error] = 'Something went wrong'
    end
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
    params.permit(:amount)
  end
end
