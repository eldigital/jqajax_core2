module JqajaxCore2
class Config
  
  # Core Setting
  cattr_accessor :core
  self.core = {}
  
  # HTML Data-Attributes
  cattr_accessor :html_data
  self.html_data = {}
  
  # Overlay and Loading Settings
  cattr_accessor :overlay, :loading
  self.overlay = {}
  self.loading = {}
  
end  
end