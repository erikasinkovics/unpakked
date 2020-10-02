class ProductCategoryTagsController < ApplicationController
  # before_action :sanitize_page_params, only: [:create, :new]

  def new
    @tag = ProductCategoryTag.new
    @store = Store.find(params[:store_id])
    authorize(@tag)
  end

  def create
    @store = Store.find(params[:store_id])
    @tag = ProductCategoryTag.new(tag_params)
    @tag.store = @store
    @categories = ProductCategory.all
    authorize(@tag)

    if @tag.save
      redirect_to store_path(@store)
    else
      render :new
    end
  end

  def destroy
    @tag = ProductCategoryTag.find(params[:id])
    authorize(@tag)
    @tag.destroy
    redirect_to store_path(@tag.store)
  end

  private

  # def sanitize_page_params
  #   params[:product_category] = params[:product_category_tag][:product_category].to_i
  # end

  def tag_params
    params.require(:product_category_tag).permit(:product_category_id)
  end
end
