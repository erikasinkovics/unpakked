class ReviewsController < ApplicationController
  before_action :set_store, only [:new, :create, :destroy]

  def new
    # @store = Store.find(params[:store_id])
    @review = Review.new
    authorize(@review)
  end

  def create
    # @store = Store.find(params[:store_id])
    @review = Review.new(review_params)
    @review.store = @store
    @review.user = current_user
    authorize(@review)

    if @review.save
      redirect_to store_path(@store)
    else
      render :new
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
