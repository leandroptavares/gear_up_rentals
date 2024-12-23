class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def my_items
    if current_user
      @items = current_user.items.order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end
  end

  def user_items
    @user = User.find(params[:user_id])
    @items = @user.items
  end

  def my_account
    if !current_user
      redirect_to new_user_session_path
    end
  end
end
