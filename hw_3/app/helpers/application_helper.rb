module ApplicationHelper
  def sortable(column, titlei = nil)
    titlei ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to titlei, { sort: column, direction: direction }, { class: css_class }
  end

  def render_stars(value)
    output = ''
    floored = value.floor
    floored.times { output += image_tag('star-on.png') }
    if (value - floored) >= 0.5
      output += image_tag('star-half.png')
    end
    (5 - value).round.times { output += image_tag('star-off.png') }
    output.html_safe
  end

end
