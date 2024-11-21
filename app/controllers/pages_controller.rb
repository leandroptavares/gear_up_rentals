class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def my_items
    if current_user
      @items = current_user.items
    else
      redirect_to  new_user_session_path
    end
  end
end
