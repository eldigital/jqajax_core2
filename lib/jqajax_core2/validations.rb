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
      
      :number => {
        :class => "#{self.prefix}-nr-validation",
        :regexp => '/[0-9\ ]{1,}/',
        :message => "Ungültige Zahl",
      },
      
      #== Validations for dates etc...
      :date => {
        :class => "#{self.prefix}-date-validation",
        # TODO: Regexp does not catch fake dates like 99.99.9999
        :regexp => "/([0-9]{2}\.[0-9]{2}\.[0-9]{4})|([0-9]{4}-[0-9]{2}-[0-9]{2})/",
        :message => "Ungültiges Datum",
      },
      
      #:date_in_future => {
      #  :class => "#{self.prefix}-date-in-future-validation",
      #  :message => "Datum darf nicht in der Vergangenheit liegen",
      #}
      #
      #:date_min_age => {
      #  :class => "#{self.prefix}-date-min-ag-validation",
      #  :data => {:min_age => 18}
      #  :message => "Ungültiges Geburtsdatum",
      #}
      
      
      #== Validations for Passwords, Confirmation etc...
      
      :password_simple => {
        :class => "#{self.prefix}-simple-pass-validation",
        # Data-Attributes used by the method, and their default values
        :data => {:length => 8},
        :message => "Min. [Length] Zeichen, min. Groß-/Kleinbuchstaben und Zahlen"
        
      },
      
      :confirmation => {
        :class => "#{self.prefix}-confirmation",
        :data => {:confirm_field => "", :confirm_name => ""},
        :message => "Bestätigung von [ConfirmName] stimmt nicht überein"
      },
      
      :exact => {
        :class => "#{self.prefix}-exact-validation",
        :data => {:value => ""},
        :message => "Eingabe ungültig"
      },
      
      :length => {
        :class => "#{self.prefix}-length-validation",
        :data => {:length => 0},
        :message => "[Length] Zeichen"
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
    