module JqajaxValidationHelper
  
  def jqac2_validation_for(*vtypes)
    if vtypes.last.is_a?(Hash)
      options = vtypes.last
      vtypes.pop
    else
      options = {}
    end    
    
    
    vtypes.each do |vtype|
      if JqajaxCore2::Validations.settings[vtype.to_sym]
        options.merge!(:class => [options[:class], JqajaxCore2::Validations.settings[vtype.to_sym][:class]].compact.join(" "))
      else
        raise ArgumentError, "Validation of type #{vtype} is not known"
      end    
    end  
    
     return options
  end
  
  def jqac2_validate_form
    JqajaxCore2::Validations.form_validation_class
  end    
  
end  