# -*- encoding : utf-8 -*-
require "jqajax_core2/config"

# Prefix
JqajaxCore2::Config.prefix = 'jqac2'
p = JqajaxCore2::Config.prefix
#== Core Settings
# Default ajax link class names
JqajaxCore2::Config.core[:ajax_link_class]    ||= "#{p}-default-link"
JqajaxCore2::Config.core[:no_ajax_link_class] ||= "#{p}-not-loaded"

# Selectbox für Ajax Trigger aktivieren
JqajaxCore2::Config.core[:select_onchange_selector]   ||= "#{p}-select-onchange"

# HTML data-Attribute for specifing the div to be updated
JqajaxCore2::Config.core[:update_div] ||= "data-jqac2-update-element"  

# id name of the main Ajax Overlay Container
JqajaxCore2::Config.core[:ajax_content_container_id] ||= "jqac2-ajax-content"  

# Placeholder string in URLS
JqajaxCore2::Config.core[:url_placeholder]  ||= ".-."

# Confirmation
JqajaxCore2::Config.core[:confirm_default]  ||= "Sind Sie sicher das Sie fortfahren möchten?"

#== Overlay and Loader Settings
JqajaxCore2::Config.overlay[:div_id]      ||= "#{p}-overlay"
JqajaxCore2::Config.overlay[:hide_label]  ||= "ausblenden"
JqajaxCore2::Config.overlay[:info_text]   ||= "Daten werden geladen"

# Show enable overlay or disable if its not wanted
JqajaxCore2::Config.overlay[:enable]                ||= true

# Show overlay when changing pages
JqajaxCore2::Config.overlay[:enable_on_page_unload] ||= true

# div area for showing flash notice/errors
JqajaxCore2::Config.loading[:flash_area_div]        ||= "#{p}-flash-area"
JqajaxCore2::Config.loading[:loader_img]            ||= "/ajax-loader.gif"
JqajaxCore2::Config.loading[:flash_area_position]   ||= :bottom_right
JqajaxCore2::Config.loading[:load_message]          ||= "data-jqac2-loading"
JqajaxCore2::Config.loading[:notify_display_duration] ||= 5000


#== Modal Settings
JqajaxCore2::Config.modal[:max_width_factor]  ||= 0.9
JqajaxCore2::Config.modal[:max_height_factor] ||= 0.9
JqajaxCore2::Config.modal[:css_class]         ||= "#{p}-modal-dialog"
JqajaxCore2::Config.modal[:layout_name]       ||= "modal_dialog"

JqajaxCore2::Config.modal[:draggable]         ||= true
JqajaxCore2::Config.modal[:drag_handle]       ||= "#{p}-modal-drag-handle"
JqajaxCore2::Config.modal[:close_icon_img]    ||= "icons/icon-close.png"

#== HTML Data
JqajaxCore2::Config.html_data[:submit_data] ||= "data-#{p}-submit-data"
JqajaxCore2::Config.html_data[:callback]    ||= "data-#{p}-callback"

# Append to existing element or overwrite content?
# $.append() or $.html()
JqajaxCore2::Config.html_data[:append]      ||= "data-#{p}-append"

# Field for confirmation content
JqajaxCore2::Config.html_data[:confirm] ||= "data-#{p}-confirm"

JqajaxCore2::Config.html_data[:target_url] ||= "data-#{p}-target-url"


# Trigger for showing load message box
::AJAX_LOAD_MESSAGE_TRIGGER       = "load-message-true"
::AJAX_HIDE_LOAD_MESSAGE_SELECTOR = "hide-load-message"



# Just show loader icon
::AJAX_TINY_LOAD_TRIGGER      = "tiny-loader"


# Trigger für EqualHeightFunktionen
# block-Elemente gleich hoch machen
::EQUAL_HEIGHT_SELECTOR       = "equal-height-cols"
::EQUAL_HEIGHT_GROUP_DATA     = "data-jqac2-equal-height-group"




# Nachricht für loadMessage

::HTML_LOAD_DEFAULT             = "Daten werden geladen"
::HTML_TINY_LOAD_DEFAULT        = "wird geladen"






require "jqajax_core2/engine"
require "jqajax_core2/validations"
require "jqajax_core2/application_controller_ext"

ActionController::Base.send(:include, JqajaxCore2::ApplicationControllerExt)


