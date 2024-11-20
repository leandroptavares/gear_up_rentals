class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def my_items
    @items = current_user.items
  end
end
