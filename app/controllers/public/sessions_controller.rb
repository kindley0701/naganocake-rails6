# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]


  protected

  def customer_state #退会しているか確認するメソッド
    @customer = Customer.find_by(email: params[:customer][:email]) #emailでcustomerを検索・取得
    return if !@customer #値が取得できなかったら(該当がなかったら)終了
    if @customer.valid_password?(params[:customer][:password]) #入力したパスワードが正しければ
      if @customer.is_deleted #退会していれば
        redirect_to new_customer_registration_path
      end
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
