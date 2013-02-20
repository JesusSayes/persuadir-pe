class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    if current_user.admin?
      @user = User.new(params[:user])
      #@user.skip_confirmation!
      if @user.save
        redirect_to users_path, notice: 'El usuario ha sido creado.'
      else
        render action: "new"
      end
    else
      redirect_to users_path, alert: "No puede crear usuarios"
    end

  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path,notice: 'El usuario ha sido eliminado' }
      # format.json { head :no_content }
    end
  end

end
