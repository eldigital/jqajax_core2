module JqAjaxCore2

  class Engine < Rails::Engine
    
    
    
    
    initializer "friends_ajax_core.load_const" do
      
      # Prefix
      p = 'jqac2'
      
      #== Core Settings
      # Default ajax link class names
      JqajaxCore2::Config.core[:ajax_link_class] = "#{p}-default-link"
      JqajaxCore2::Config.core[:no_ajax_link_class] = "#{p}-not-loaded"
      
      # Selectbox für Ajax Trigger aktivieren
      JqajaxCore2::Config.core[:select_onchange_selector]   = "#{p}-select-onchange"
      
      # HTML data-Attribute for specifing the div to be updated
      JqajaxCore2::Config.core[:update_div] = "data-jqac2-update-element"  
      
      #== Overlay and Loader Settings
      JqajaxCore2::Config.overlay[:div_id] = "#{p}-overlay"
      JqajaxCore2::Config.overlay[:hide_label] = "ausblenden"
      JqajaxCore2::Config.overlay[:info_text]       = "Daten werden geladen"
      
      # Show overlay when changing pages
      # TODO: unused yet (28.06.2014, 16:35, Florian Eck)
      JqajaxCore2::Config.overlay[:enable_on_page_unload] = true
      
      JqajaxCore2::Config.loading[:flash_area_div]      = "#{p}-flash-area"
      JqajaxCore2::Config.loading[:loader_img]          = "ajax-loader.gif"
      JqajaxCore2::Config.loading[:flash_area_position] = :bottom_right
      
      
      
      #== Default div id's, global layout etc...
      # id name of the main Ajax Overlay Container
      # there are tow default containers to provide more flexibility
      ::AJAX_OVERLAY_CONTAINER_NAME   = "ajax-overlay-container"
      ::AJAX_OVERLAY_CONTAINER_NAME_2 = "ajax-overlay-container-2"

      ::AJAX_OVERLAY_CLASS          = "ajax-overlay"
      ::INFO_OVERLAY_CLASS          = "info-overlay"

      ::AJAX_OVERLAY_LAYOUT         = "ajax_overlay"
      ::INFO_OVERLAY_LAYOUT         = "info_overlay"


      
      
      
      # Trigger for showing load message box
      ::AJAX_LOAD_MESSAGE_TRIGGER       = "load-message-true"
      ::AJAX_HIDE_LOAD_MESSAGE_SELECTOR = "hide-load-message"
      ::AJAX_PUSH_PROGRESS_TRIGGER      = "push-progress-trigger"
      
      
      # Just show loader icon
      ::AJAX_TINY_LOAD_TRIGGER      = "tiny-loader"

      # div area for showing flash notice/errors
      ::FLASH_AREA_DIV              = "notify-area"

      # Werden Daten aus Formular etc. versendet?
      ::AJAX_SUBMIT_DATA_TRIGGER    = "data-jqac2-submit-data"

      # Trigger für EqualHeightFunktionen
      # block-Elemente gleich hoch machen
      ::EQUAL_HEIGHT_SELECTOR       = "equal-height-cols"
      ::EQUAL_HEIGHT_GROUP_DATA     = "data-jqac2-equal-height-group"




      #== Data Types (HTML 5 data-attribute)
      # Bestätigung per confirm
      ::HTML_DATA_CONFIRM             = "data-jqac2-confirm"
      ::HTML_CONFIRM_DEFAULT          = "Sind Sie sicher?"

      # Nachricht für loadMessage
      ::HTML_DATA_LOADING             = "data-jqac2-loading"
      ::HTML_LOAD_DEFAULT             = "Daten werden geladen"
      ::HTML_TINY_LOAD_DEFAULT        = "wird geladen"

      # Wird ein Callbackausgeführt (JS)
      ::HTML_DATA_CALLBACK            = "data-jqac2-callback"

      # Ziel-Div wird nicht überschrieben
      ::HTML_DATA_APPEND              = "data-jqac2-append"

      #== Forms - Triggers for select onchange etc

      # Ziel URL als HTML5-Data
      ::HTML_DATA_TARGET_URL          = "data-jqac2-target-url"

      # url-Paramter für ausgewählten Wert (ehem. :with => 'value='+this.value)
      # Url Value replacment string
      ::HTML_URL_VALUE_PLACEHOLDER    = ".-."

     

      
    end
  
  end  


end
