# -*- encoding : utf-8 -*-
module JqajaxCoreHelper
  
  
  #== New and shiny polished Rails 3.2 Ajax Helper Functions
  
  # Default Ajax Link for Links
  def default_ajax_link(options ={})
    link_data = init_link_data(options)
    
    link_data.merge!(:title => options[:title])
    options[:class] ||= ""
    options[:class] << " #{JqajaxCore2::Config.core[:ajax_link_class]} #{JqajaxCore2::Config.core[:no_ajax_link_class]}"
    
    if options[:append] == true
      link_data.merge!(JqajaxCore2::Config.html_data[:append] => true)
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
    
    link_data.merge!(html_defaults_from_options(options))
    
    return link_data
  end  
  
  # 
  def select_onchange_data(options ={})
    link_data = init_link_data(options)
    
    link_data.merge!(:disabled  => options[:disabled])  
    options[:class] ||= ""
    options[:class] << " #{JqajaxCore2::Config.core[:select_onchange_selector]} #{JqajaxCore2::Config.core[:no_ajax_link_class]}"

    options[:with] ||= :id  

    options[:url].merge!(options[:with] => JqajaxCore2::Config.core[:url_placeholder])
    link_data.merge!(JqajaxCore2::Config.html_data[:target_url].to_s => (options[:scope] || main_app).url_for(options[:url]))
    
    # Load-Message setzen: Entweder default oder eigene Nachricht
    if options[:load_message] && (options[:load_message] != false && !options[:load_message].blank?)
      options[:class] << " #{AJAX_LOAD_MESSAGE_TRIGGER}"
      if options[:load_message].is_a?(String)
        link_data.merge!(HTML_DATA_LOADING.to_s => options[:load_message])
      end    
    elsif options[:load_message] == false
      options[:class]   << " #{AJAX_HIDE_LOAD_MESSAGE_SELECTOR}"
    end
    
    link_data.merge!(html_defaults_from_options(options))
    
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
  
  
  private
  
  def init_link_data(options = {})
    link_data = {:remote => true}
    link_data.merge!(update_div_from_options(options))
    link_data.merge!(submit_from_options(options))
    link_data.merge!(callback_from_options(options))
    link_data.merge!(confirm_message_from_options(options))  
    return link_data
  end  
  
  def confirm_message_from_options(options = {})
    # Confirm-Message setzen: Entweder default, oder eigene Nachricht
    if options[:confirm]
      { JqajaxCore2::Config.html_data[:confirm] => (options[:confirm] == true ? JqajaxCore2::Config.core[:confirm_default] : options[:confirm].to_s )} 
    else
      return {}
    end   
  end
  
  def callback_from_options(options = {})
    options[:callback] ? {JqajaxCore2::Config.html_data[:callback] => options[:callback]} : {}
  end
  
  def submit_from_options(options = {})    
    options[:submit] ? {JqajaxCore2::Config.html_data[:submit_data] => options[:submit]} : {}
  end
  
  def update_div_from_options(options = {})
    options[:update]  ?  { JqajaxCore2::Config.core[:update_div] => options[:update]} : {}
  end
  
  def html_defaults_from_options(options = {})  
    l = {} 
    l.merge!(:class => options[:class])
    l.merge!(:id    => options[:id])
    l.merge!(:style => options[:style])
    return l
  end  
  
end
