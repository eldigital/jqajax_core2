# -*- encoding : utf-8 -*-
class Jqac2Controller < ApplicationController
  
  # flash[:notice/error] Laden
  def json_flash_data
    render :text => flash.to_json, :status => 200
  end
  
end  
