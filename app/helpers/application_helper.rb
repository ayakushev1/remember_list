module ApplicationHelper
  def title
    base_title = "TITLE"
    if @title.nil?
      base_title
    else
#      "#{base_title} | #{@title}"
      "#{@title}"
    end    
  end

  def logo
    image_tag("imgLogo.jpg", :alt => "Remember me", :class => "imgLogo")
  end
  

  
end
