class ReviewsController < ApplicationController
  before_action :set_store, only [:new, :create, :destroy]

  def new
    @review = Review.new
    # @store = Store.find(params[:store_id])
    authorize(@review)
  end

  def create
    @review = Review.new(review_params)
    # @store = Store.find(params[:store_id])
    @review.store = @store
    @review.user = current_user
    authorize(@review)
    if @review.save
      redirect_to store_path(@store)
    else
      render 'new'
    end
  end

  def destroy
    # @store = Store.find(params[:store_id])
    @review = @store.reviews.find(params[:id])
    authorize(@review)
    @review.destroy
    redirect_to store_path(@store)
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
