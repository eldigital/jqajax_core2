module JqajaxCore2
  module ApplicationControllerExt
    
    def render_blank_ajax
      render :text => nil, :status => 200, :content_type => "text/html"
    end  
  
    def ajax_layout(layout_name="info_overlay")
      render :layout => layout_name if request.xhr?
    end  
  
    def ajax_text(text)
      render :text => text.html_safe, :status => 200, :content_type => "text/html"
    end
    
  end
end    