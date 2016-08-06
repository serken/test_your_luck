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
end
