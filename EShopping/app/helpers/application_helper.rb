module ApplicationHelper

  def collapse_css(selected, category)
    if selected.id == category.id
      "panel-collapse collapse in"
    else
      "panel-collapse collapse"
    end
  end
end
