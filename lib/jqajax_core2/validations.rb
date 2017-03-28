module JqajaxCore2
  class Validations

    cattr_accessor :settings, :checkbox_validation_class, :skip_validation_class, :form_validation_class, :prefix,  :data_prefix, :error_description_class

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
        :regexp => '/[0-9+]{1,}[0-9\ \/]{1,}/',
        :message => "Keine gültige Telefonnummer"
      },

      :phone_int => {
        :class => "#{self.prefix}-phone-int-validation",
        :regexp => '/\+[1-9]{1}[0-9]{1,3}\ ?[0-9\ ]{1,}/',
        :message => "Keine gültige Telefonnummer (Format +xx xxx...)"
      },

      :letters_only => {
        class: "#{self.prefix}-letters-validation",
        regexp: '/^[A-z\ ]+$/',
        message: "Nur Buchstaben und Leerzeichen"
      },

      :alphanumeric => {
        class: "#{self.prefix}-alphanum-validation",
        regexp: '/^[A-z0-9\ ]+$/',
        message: "Nur Buchstaben, Zahlen und Leerzeichen"
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

      :datemonth => {
        :class => "#{self.prefix}-date-month-validation",
        :regexp => "/[0-9]{2}\.[0-9]{4}/",
        :message => "Ungültiges Format (MM.JJJJ)",
      },

      :datetime => {
        :class => "#{self.prefix}-datetime-validation",
        :regexp => "/[0-9]{2}\.[0-9]{2}\.[0-9]{4}\ [0-9]{2}\:[0-9]{2}/",
        :message => "Ungültiges Format (DD.MM.YYYY HH:MM)",
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
        :data => {:length => 6},
        :message => "Min. [Length] Zeichen, min. Buchstaben und Zahlen"

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
        :message => "Pflichtfeld"
      },

      :from_service => {
        :class => "#{self.prefix}-from-service",
        :data => {:url => "#", :additional_values => {}.to_json }
      }
    }

    self.checkbox_validation_class  = "#{self.prefix}-validate-checkbox"
    self.skip_validation_class      = "#{self.prefix}-skip-validation"
    self.form_validation_class      = "#{self.prefix}-form-validation"
    self.error_description_class    = "error-description"
  end
end
