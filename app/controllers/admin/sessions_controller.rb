# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController

  # def admin_check
  #   if user_signed_in? && current_user.role == "adamin"
  #       riderect_to new_admin_product_path
  #   else
  #       render action: :edit
  #       flash[:alert] = "管理者画面です"
  #   end
  # end


  # before_action :configure_sign_in_params, only: [:create]

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