class UsersController < ApplicationController
  before_action :set_users, only: [:destroy, :edit]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white user through.
    def list_params
      params[:user]
    end
end
