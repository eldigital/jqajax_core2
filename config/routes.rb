# -*- encoding : utf-8 -*-
JqAjaxCore2::Engine.routes.draw do
  
  #=== AJAX Routing
  # Ajax Routen immer in Klartext, da diese auch in JS manuell verwendet werden.
  get "/jqca2/jqac2_flash",  :controller => "jqac2", :action => "json_flash_data"
  #get "/jqca2/auto_complete",    :controller => "ajax", :action => "auto_complete"
  #get "/jqca2/save_slidedown_box/:id",    :controller => "ajax", :action => "save_slidedown_box"

end
