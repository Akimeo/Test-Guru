module SessionsHelper
  def flash_message
    flash.map { |type, msg| content_tag :p, msg, class: "flash #{type}" }.join.html_safe
  end
end
