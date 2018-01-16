class CategoriesController < ApplicationController
  def index
    @categories = Category.hash_tree
  end
  
  def show
    @category = Category.new
  end

  def new
    @category = Category.new(parent_id: params[:parent_id]) #We are passing the parent_id of the category
  end

  def create
  if params[:category][:parent_id].to_i > 0
    parent = Category.find_by_id(params[:category].delete(:parent_id)) #We want to delete the parent_id from params, as we don't permit it
    @category = parent.children.build(category_params) #We build a child loop of the category
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

     redirect_to root_url #re-directing to the "products" list view page, which is defined as the root url at routes
  end

private

  def category_params
    params.require(:category).permit(:name, :description) # We are permitting only name and desciption of the categories
  end

end
