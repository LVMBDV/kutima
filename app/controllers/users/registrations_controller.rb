# frozen_string_literal: true

module Users
  ##
  # Subclasses registrations controller to disable unused routes
  class RegistrationsController < Devise::RegistrationsController
    # GET /resource/edit
    def edit
      render :not_found
    end

    # PUT /resource
    def update
      render :not_found
    end

    # DELETE /resource
    def destroy
      render :not_found
    end

    # GET /resource/cancel
    def cancel
      render :not_found
    end
  end
end
