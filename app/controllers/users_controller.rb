class UsersController < ApplicationController
  before_action :set_users, only: [:destroy, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def edit

  end
  def new
    @user = User.new
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
       format.html { redirect_to users_path, notice: 'item was successfully updated.' }
      else 
        format.html { render action: 'new' }
      end
    end
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white user through.
    def user_params
      params[:user]
    end
end
