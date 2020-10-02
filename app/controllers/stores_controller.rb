class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = policy_scope(Store)
    authorize(Store)
  end

  def show
    # @store = Store.find(params[:id])
    @tags = @store.product_categories
    authorize(@store)
  end

  def new
    @store = Store.new
    authorize(@store)
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    authorize(@store)
    if @store.save
      redirect_to store_path(@store)
    else
      render 'new'
    end
  end

  def edit
    # @store = Store.find(params[:id])
    authorize(@store)
  end

  def update
    # @store = Store.find(params[:id])
    authorize(@store)
    if @store.save
      redirect_to store_path(@store)
    else
      render 'show'
    end
  end

  def destroy
    # @store = Store.find(params[:id])
    authorize(@store)
    @store.destroy
    redirect_to stores_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :city, :address, :postal_code, :avg_rating, :status)
  end
end
