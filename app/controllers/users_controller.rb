class UsersController < ApplicationController

  def all_users
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "users_templates/all_users"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @users = matching_users.at(0)

    render({ :template => "users_templates/user_details"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    @user = matching_users.at(0)
    
    @user.username = params.fetch("query_username")
    @user.save
    redirect_to("/users/#{user.username}")
  end

end
