module JqajaxValidationHelper
  
  def jqac2_validation_for(*vtypes)
    if vtypes.last.is_a?(Hash)
      options = vtypes.last
      vtypes.pop
    else
      options = {}
    end    
    
    # validierungsoptionen
    if options[:validator_options]
      options[:validator_options].each do |opt, val|
        options.merge!(jqac2_data_attribute_for(opt) => val)
      end  
    end  
    
    vtypes.each do |vtype|
      if JqajaxCore2::Validations.settings[vtype.to_sym]
        options.merge!(:class => [options[:class], JqajaxCore2::Validations.settings[vtype.to_sym][:class]].compact.join(" "))
        
      elsif vtype.nil?
        options
      else  
        raise ArgumentError, "Validation of type #{vtype} is not known"
      end    
    end  
    
     return options
  end
  
  def jqac2_validate_form
    JqajaxCore2::Validations.form_validation_class
  end  
  
  def jqac2_data_attribute_for(m="bla")
    "data-#{JqajaxCore2::Validations.data_prefix}-#{m.to_s.dasherize}"
  end    
  
  def init_jqac2_validator 
    javascript_tag("JqAjaxCore2.Validation.initForms()")
  end  
  
end  