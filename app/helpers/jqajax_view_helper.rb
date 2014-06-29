module JqajaxViewHelper
  
  
  def include_jqajax_overlay
    render :partial => "/jqajax/overlay"
  end
  
  def include_jqajax_flash
    render :partial => "/jqajax/flash"
  end
  
  def include_jqajax_core(*elements)
    elements = %w(overlay flash) if elements.empty?
    
    elements.each do |e|
      concat(self.send("include_jqajax_#{e}"))
    end
    return nil  
  end    
  
  
  
  def jqajax_modal(options = {}, &block)
    options[:draggable] = JqajaxCore2::Config.modal[:draggable]
    render "/jqajax/modal", :options => options, :content => capture(&block)
  end  
  
  
end  