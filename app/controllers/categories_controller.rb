class CategoriesController < ApplicationController
  def index
    @categories = Category.hash_tree
  end
  
  def show
    @category = Category.new
  end

  def new
    @category = Category.new(parent_id: params[:parent_id])
  end

  def create
  if params[:category][:parent_id].to_i > 0
    parent = Category.find_by_id(params[:category].delete(:parent_id))
    @category = parent.children.build(category_params)
  else
    @category = Category.new(category_params)
  end

    if @category.save
      flash[:success] = 'Your category was successfully added!'
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def destroy
     @category = Category.find(params[:id])
     @category.destroy

     redirect_to root_url
  end

private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
