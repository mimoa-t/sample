class CategoriesController < ApplicationController

  def index
    @main_categories = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    if @category.is_root?
      @products = Product.where(category_id: @category.descendant_ids).order('created_at DESC').where.not(status_id: 3).page(params[:page]).per(100)
    elsif @category.childless?
      @products = Product.where(category_id: @category.path_ids).order('created_at DESC').where.not(status_id: 3).page(params[:page]).per(100)
    else
      @products = Product.where(category_id: @category.subtree_ids).order('created_at DESC').where.not(status_id: 3).page(params[:page]).per(100)
    end
  end
  
end
