class ProfilesController < ApplicationController
  def index
  end

  def prepare_payment
    payment_params = {
      m_shop: TestYourLuck.config.payeer.merchant_id,
      m_orderid: '1',
      m_amount: params[:amount],
      m_curr: 'USD',
      m_desc: Base64.encode64('Description_test'),
      m_key: TestYourLuck.config.payeer.merchant_secret
    }

    sign = (Digest::SHA256.hexdigest(payment_params.values.join(':'))).upcase
    payment_params.delete(:m_key)

    render json: payment_params.merge(m_sign: sign)
  end


  def make_deposit
    if current_user.deposit amount_params[:amount].to_f
      flash[:success] = 'Updated'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to profile_path
  end

  def make_withdraw
    if current_user.withdraw amount_params[:amount].to_f
      flash[:success] = 'Updated'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to profile_path
  end

  def update_profile
    current_user.update_attributes(user_params)
    if current_user.valid?
      flash[:success] = 'Updated'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to profile_path
  end

  private

  def user_params
    params[:user].permit!
  end

  def amount_params
    params.permit(:amount)
  end
end
