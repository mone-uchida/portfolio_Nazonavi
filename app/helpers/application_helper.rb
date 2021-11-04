module ApplicationHelper
  BASETITLE = 'なぞなび'.freeze
  def title(page_title)
    if page_title.empty?
      BASETITLE
    else
      "#{page_title} | #{BASETITLE}"
    end
  end
end
