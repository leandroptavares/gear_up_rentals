class ReviewsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if !current_user
      redirect_to item_path(@item), notice: "Please login first"
      return
    end
    @review = Review.new(review_params)
    @review.item = @item
    @review.user = current_user
    if @review.save
      redirect_to item_path(@item)
    else
      redirect_to item_path(@item), alert: "Couldn't create review"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    item = @review.item
    @review.destroy
    redirect_to item_path(item)
  end

  private

  def review_params
    params.require(:review).permit(:comments, :rating, :item_id)
  end
end
