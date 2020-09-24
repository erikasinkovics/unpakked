class ProductCategoriesController < ApplicationController
  def index
    @categories = policy_scope(ProductCategory)
    authorize(ProductCategory)
  end

  def new
    @category = ProductCategory.new
    authorize(@category)
  end

  def create
    @category = ProductCategory.new(category_params)
    authorize(@category)
    if @category.save
      redirect_to product_categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = ProductCategory.find(params[:id])
    authorize(@category)
    @category.destroy
    redirect_to product_categories_path
  end

  private

  def category_params
    params.require(:product_category).permit(:name)
  end
end
