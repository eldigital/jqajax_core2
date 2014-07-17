module JqajaxCore2
class Config
  
  #= Core Setting
  cattr_accessor :core, :prefix
  self.core = {}
  
  #= HTML Data-Attributes
  # Naming of the HTML data-attributes for the link element config
  cattr_accessor :html_data
  self.html_data = {}
  
  #= Overlay and Loading Settings
  # Config for loading overlay, flash notifiers etc.
  cattr_accessor :overlay, :loading
  self.overlay = {}
  self.loading = {}
  
  #= Modal Settings
  # Config for appearance and behavior of modal dialog
  cattr_accessor :modal
  self.modal = {}
  
  def self.initialize 
    
    
    
  end  
  
end  
end