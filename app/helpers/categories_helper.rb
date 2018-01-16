module CategoriesHelper
  #On each iteration, take a category and its children storing it in the category and nested_categories variables. 
  #Next, render the category (the _category.html.erb partial is used) and check if there are any more nested categories. If yes, we call the same categories_tree_for method again passing the nested_categories variable. 
  #Also, note that we wrap the result of this method call with a div tag that has the replies class.
  def categories_tree_for(categories)
    categories.map do |comment, nested_categories|
      render(comment) +
          (nested_categories.size > 0 ? content_tag(:div, categories_tree_for(nested_categories), class: "replies") : nil)
    end.join.html_safe
  end
end