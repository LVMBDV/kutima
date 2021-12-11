# frozen_string_literal: true

##
# Controller for account settings.
class SettingsController < ApplicationController
  include Onboardable

  before_action :set_user

  # GET /settings
  def show; end

  # GET /settings/details
  def details; end

  # GET /settings/details/edit
  def edit_details; end

  # PUT /settings/details
  def update_details
    respond_to do |format|
      if @user.update(update_details_params)
        bypass_sign_in(@user)
        format.html { redirect_to settings_path }
        format.turbo_stream { render :update_details_success }
      else
        format.html { render :edit_details }
        format.turbo_stream { render :update_details_failure }
      end
    end
  end

  # GET /settings/password
  def password; end

  # GET /settings/password/edit
  def edit_password; end

  # PUT /settings/password
  def update_password
    respond_to do |format|
      if @user.update_with_password(update_password_params)
        bypass_sign_in(@user)
        format.html { redirect_to settings_path }
        format.turbo_stream { render :update_password_success }
      else
        format.html { render :edit_password }
        format.turbo_stream { render :update_password_failure }
      end
    end
  end

  # GET /settings/account/delete
  def delete_account; end

  # DELETE /settings/account/delete
  def destroy_account
    respond_to do |format|
      if @user.valid_password?(destroy_account_params[:password])
        @user.destroy
        format.html { redirect_to root_path, notice: 'Account successfully deleted!' }
      else
        @user.errors.add(:password, 'is incorrect')
        format.html { render :delete_account }
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_profile
    @profile = current_user.profile
  end

  def update_details_params
    params.require(:user).permit(:email, :username, profile_attributes: %i[id first_name last_name])
  end

  def update_password_params
    params.require(:user).permit(%i[password password_confirmation current_password])
  end

  def destroy_account_params
    params.require(:user).permit(:password)
  end
end
