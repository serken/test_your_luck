class ProfilesController < ApplicationController
  def index
  end

  def wallets
    render :text, partial: 'wallets'
  end

  def deposit
  end

  def withdraw
  end

  def edit
    render 'users/registrations/edit'
  end
end
