# -*- encoding : utf-8 -*-
module JqajaxCoreHelper
  
  
  #== New and shiny polished Rails 3.2 Ajax Helper Functions
  
  # Default Ajax Link for Links
  def default_ajax_link(options ={})
    link_data = {:remote => true}
    
    
    options[:class] ||= ""
    options[:class] << " #{JqajaxCore2::Config.core[:ajax_link_class]} #{JqajaxCore2::Config.core[:no_ajax_link_class]}"

    link_data.merge!("#{HTML_DATA_UPDATE_DIV}") << options[:update]  if options[:update] 
    
    options[:class] << " #{AJAX_TINY_LOAD_TRIGGER}" if options[:tiny_loader] == true
    
    if options[:submit]
      link_data.merge!(JqajaxCore2::Config.html_data[:submit_data] => options[:submit])
    end  
    
    # Callbacks/JS
    if options[:callback]
      link_data.merge!(JqajaxCore2::Config.html_data[:callback] => options[:callback])
    end  
    
    if options[:append] == true
      link_data.merge!(JqajaxCore2::Config.html_data[:append] => true)
    end  
    
    # Confirm-Message setzen: Entweder default, oder eigene Nachricht
    if options[:confirm]
      if options[:confirm] = true
        link_data.merge!(:confirm => HTML_CONFIRM_DEFAULT.to_s)
      else
        link_data.merge(:confirm => options[:confirm])
      end    
    end  
    
      
    # Load-Message setzen: Entweder default oder eigene Nachricht
    if options[:load_message] && (options[:load_message] != false && !options[:load_message].blank?)
      options[:class] << " #{AJAX_LOAD_MESSAGE_TRIGGER}"
      if options[:load_message].is_a?(String)
        link_data.merge!(HTML_DATA_LOADING.to_s => options[:load_message])
      end    
    elsif options[:load_message] == false
      options[:class]   << " #{AJAX_HIDE_LOAD_MESSAGE_SELECTOR}"
    end  
    
    link_data.merge!(:class => options[:class])
    link_data.merge!(:id    => options[:id])
    link_data.merge!(:title => options[:title])
    link_data.merge!(:style => options[:style])
    
    return link_data
  end  
  
  # 
  def select_onchange_data(options ={})
    link_data = {}
    
    
    options[:class] ||= ""

    options[:class] << " #{JqajaxCore2::Config.core[:select_onchange_selector]} #{JqajaxCore2::Config.core[:no_ajax_link_class]}"
    
    link_data.merge!("#{HTML_DATA_UPDATE_DIV}") << options[:update]  if options[:update]

    options[:class] << " #{AJAX_TINY_LOAD_TRIGGER}" if options[:tiny_loader] == true
    
    if options[:submit]
      link_data.merge!(JqajaxCore2::Config.html_data[:submit_data] => options[:submit])
    end
    
    options[:with] ||= :id  
    if options[:with]  
      options[:url].merge!(options[:with] => JqajaxCore2::Config.core[:url_placeholder])
    end  
    
    if options[:url]
      link_data.merge!(HTML_DATA_TARGET_URL.to_s => url_for(options[:url]))
    end
    
    # Confirm-Message setzen: Entweder default, oder eigene Nachricht
    if options[:confirm]
      if options[:confirm] = true
        link_data.merge!(:confirm => HTML_CONFIRM_DEFAULT.to_s)
      else
        link_data.merge(:confirm => options[:confirm])
      end    
    end  

    # Load-Message setzen: Entweder default oder eigene Nachricht
    if options[:load_message] && (options[:load_message] != false && !options[:load_message].blank?)
      options[:class] << " #{AJAX_LOAD_MESSAGE_TRIGGER}"
      if options[:load_message].is_a?(String)
        link_data.merge!(HTML_DATA_LOADING.to_s => options[:load_message])
      end    
    elsif options[:load_message] == false
      options[:class]   << " #{AJAX_HIDE_LOAD_MESSAGE_SELECTOR}"
    end
    
    link_data.merge!(:class => options[:class])
    link_data.merge!(:id    => options[:id])
    link_data.merge!(:disabled => options[:disabled])
    
    return link_data
  end
  
  
  
  # Creates a box that slides down and up to show/hide the content. 
  # * Use ':open => true' to set the box open by default
  # * Use ':default_class => "className"' to set the class used for the header
  def slide_down_box(title, options = {:open => false}, &block)
    options[:default_class] ||= "icon-arrow-right"
    options[:type]        ||= :div
    
    
    box_session_id = Digest::SHA1.hexdigest("#{params[:action]}-#{title}")
    
    open = options[:open] #|| (session[:slidedown_boxes_open].include?(box_session_id) rescue false)
    
    concat raw("<div class='js-slide-down-box  plain #{'open' if open} #{options[:box_class]} #{options[:class]}' data-session-id='#{box_session_id}'>
    <#{options[:type]} class='#{options[:default_class]} js-slidedown-button'>
    #{title}
    </#{options[:type]}>
    <div class='js-slidedown-content'>") 
    yield
    concat raw("</div></div>")  
  end
  
  
  
  def init_slidedown
    raw("<script type='text/javascript'>init_slidedown();</script>")
  end
end
