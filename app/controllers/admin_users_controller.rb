class AdminUsersController < ApplicationController

  layout 'admin'
  before_action :find_admin_user, :only => [ :edit, :update, :delete, :destroy ]
  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.create(admin_user_params)
    if @admin_user.save
        flash[:notice] = "Admin_user created successfully."
        redirect_to(admin_users_path)
    else
        render("new")
    end
  end

  def edit
  end

  def update
    if @admin_user.update_attributes(admin_user_params)
        flash[:notice] = "Admin_user updated successfully."
        redirect_to(admin_users_path)
    else
        render("edit")
    end
  end

  def delete
  end

  def destroy
    @admin_user.destroy
    flash[:notice] = "Admin_user #{@admin_user.name} destroyed successfully."
    redirect_to(admin_users_path)
  end

private
def admin_user_params
    params.require(:admin_user).permit(:username, :first_name, :last_name, :email, :password)
end

def find_admin_user
    @admin_user = AdminUser.find(params[:id])
end

end
