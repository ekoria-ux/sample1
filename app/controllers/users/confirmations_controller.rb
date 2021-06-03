# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.find_by(confirmation_token: params[:confirmation_token])
    super if !resource || resource.confirmed?
  end

  def confirm
    self.resource = resource_class.find_by(confirmation_token: params[:confirmation_token])
    resource.password = params[resource_name][:password]
    resource.password_confirmation = params[resource_name][:password_confirmation]
    if resource.password_match? && resource.update(confirm_params)
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      set_flash_message :notice, :confirmed
      sign_in resource
      redirect_to mypage_path
    else
      render :show
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end

  private
  def confirm_params
    params.require(resource_name).permit(:password, :password_confirmation)
  end
end
