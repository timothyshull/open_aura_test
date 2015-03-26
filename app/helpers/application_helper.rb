module ApplicationHelper
  
  # Dynamic page title even though it's a single page app
  def full_title(page_title = '')
    base_title = "OpenAura API Example"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
