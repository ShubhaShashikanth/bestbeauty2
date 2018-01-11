module CategoriesHelper
  def categories_tree_for(categories)
    categories.map do |comment, nested_categories|
      render(comment) +
          (nested_categories.size > 0 ? content_tag(:div, categories_tree_for(nested_categories), class: "replies") : nil)
    end.join.html_safe
  end
end