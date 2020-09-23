class ProductCategoriesController < ApplicationController
  def new
    @category = ProductCategory.new
    authorize(@category)
  end

  def create
    @category = ProductCategory.new(category_params)
    @store = Store.find(params[:store_id])
    @category.store = @store
    authorize(@category)
    if @category.save
      redirect_to store_path(@store)
    else
      render 'new'
    end
  end

  def destroy
    @store = Store.find(params[:store_id])
    @category = ProductCategory.find(params[:id])
    authorize(@category)
    @category.destroy
    redirect_to store_path(@store)
  end

  private

  def category_params
    params.require(:product_category).permit(:name)
  end
end
