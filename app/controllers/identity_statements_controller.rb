# frozen_string_literal: true

##
# Controller for identity statement resources.
class IdentityStatementsController < ApplicationController
  before_action :set_identity_statement, only: %i[show edit update destroy]

  # GET /identity-statements
  def index
    @identity_statements = current_user.identity_statements
  end

  # GET /identity-statements/new
  def new
    @identity_statement = IdentityStatement.new
  end

  # GET /identity-statements/new-reset
  def new_reset; end

  # GET /identity-statements/:id
  def show; end

  # GET /identity-statements/:id/edit
  def edit; end

  # POST /identity-statements
  def create
    @identity_statement = IdentityStatement.new(identity_statement_params.merge(user: current_user))
    respond_to do |format|
      if @identity_statement.save
        format.html { redirect_to identity_statement_path(@identity_statement) }
        format.turbo_stream { render :create_success }
      else
        format.html { render :new }
        format.turbo_stream { render :create_failure }
      end
    end
  end

  # PATCH/PUT /identity-statements/:id
  def update
    respond_to do |format|
      if @identity_statement.update(identity_statement_params)
        format.html { redirect_to identity_statement_path(@identity_statement) }
        format.turbo_stream { render :update_success }
      else
        format.html { render :edit }
        format.turbo_stream { render :update_failure }
      end
    end
  end

  # DELETE /identity-statements/:id
  def destroy
    @identity_statement.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.turbo_stream
    end
  end

  private

  def set_identity_statement
    @identity_statement = IdentityStatement.find(params[:id])
  end

  def identity_statement_params
    params.require(:identity_statement).permit(%i[identity objective life_area user_id])
  end
end
