# frozen_string_literal: true

##
# Controller for profile endpoints.
class ProfilesController < ApplicationController
  skip_before_action :onboard_user, only: %i[new create]

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    @user = current_user
    @profile = Profile.find(params[:id])
  end

  # GET /me or me.json
  def me
    @user = current_user
    @profile = current_user.profile
    render :show
  end

  # GET /profiles/new
  def new
    redirect_to profile_path(current_user.profile) and return if current_user.profile.present?

    @profile = Profile.new(user: current_user)
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
  end

  # POST /profiles or /profiles.json
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def create
    redirect_to user_profile_path and return if current_user.profile.present?

    profile = Profile.new(profile_params.merge(user: current_user))

    respond_to do |format|
      if profile.save
        format.html { redirect_to dashboard_path, notice: 'Welcome to Kutima! You\'re ready to start optimizing.' }
        format.json { render :show, status: :created, location: profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if current_user.profile.update(profile_params)
        format.html { redirect_to user_profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user.profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: current_user.profile.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def profile_params
    params.require(:profile).permit(%i[id first_name last_name])
  end
end
