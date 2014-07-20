module JqajaxCore2
  class Validations
    
    cattr_accessor :settings, :checkbox_validation_class, :skip_validation_class, :form_validation_class, :prefix,  :data_prefix
    
    self.prefix = "#{JqajaxCore2::Config.prefix}-vld"
    self.data_prefix = "data-#{JqajaxCore2::Config.prefix}"
    
    # Defition der Verüfgbaren validierungen:
    # - Ist :regexp gesetzt, wird automatisch eine Validierungsfunktion für die Regexp in JS angelegt
    #   bei fehler wird die :message zurückgegeben
    # - Ist keine Regexp angegeben muss eine Funktion manuell erstellt werden
    
    self.settings = {
    
      :email => {
        :class => "#{self.prefix}-email-validation",
        :regexp => '/[a-zA-Z0-9\.\-_]{1,}@[a-zA-Z0-9\.\-_]{1,}\.[a-zA-Z0-9\.\-_]{2,4}/',
        :message => "Keine gültige E-Mail-Adresse"
      },
    
      :phone => {
        :class => "#{self.prefix}-phone-validation",
        :regexp => '/\+[1-9]{1}[0-9]{1,3}\ ?[0-9\ ]{1,}/',
        :message => "Keine gültige Telefonnummer"
      },
    
      :zip => {
        :class => "#{self.prefix}-zip-validation",
        :regexp => '/[0-9]{4,5}/',
        :message => "Ungültige PLZ",
      },
    
      :date => {
        :class => "#{self.prefix}-date-validation",
        :regexp => "/^([1-9]|0[1-9]|[12][0-9]|3[01])[-\.]([1-9]|0[1-9]|1[012])[-\.]\d{4}$/",
        :message => "Ungültiges Datum",
      },
      
      :password_simple => {
        :class => "#{self.prefix}-simple-pass-validation",
        # Data-Attributes used by the method, and their default values
        :data => {:length => 8},
        :message => "Min. [Length] Zeichen, min. Groß-/Kleinbuchstaben und Zahlen"
        
      },
      
      :confirmation => {
        :class => "#{self.prefix}-confirmation",
        :data => {:confirm_field => "", :confirm_name => ""},
        :message => "Bestätigung stimmt nicht überein"
      },
    
      :required => {
        :class => "#{self.prefix}-required-validation",
        :regexp => '/[a-zA-Z0-9]{1,}/',
        :empty => false,
        :message => "Feld ist erforderlich"
      },
    }
    
    
    self.checkbox_validation_class  = "#{self.prefix}-validate-checkbox"
    self.skip_validation_class      = "#{self.prefix}-skip-validation"
    self.form_validation_class      = "#{self.prefix}-form-validation"
  end
end  
    