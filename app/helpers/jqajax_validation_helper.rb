module JqajaxValidationHelper

  def jqac2_validation_for(*vtypes)
    if vtypes.last.is_a?(Hash)
      options = vtypes.last
      vtypes.pop
    else
      options = {}
    end

    current_data_attributes = options.delete(:data) || {}

    # if a custom class for the form field wrapper is required....
    current_data_attributes.merge!(wrapper_class: options[:wrapper_class]) if options[:wrapper_class]

    # validierungsoptionen
    if options[:validator_options]
      options[:validator_options].each do |opt, val|
        options.merge!(jqac2_data_attribute_for(opt) => val)
      end
      options.delete(:validator_options)
    end

    data_messages = []
    if options[:hint]
      data_messages << options[:hint]
    end

    vtypes.each do |vtype|
      if JqajaxCore2::Validations.settings[vtype.to_sym]
        options.merge!(:class => [options[:class], JqajaxCore2::Validations.settings[vtype.to_sym][:class]].compact.join(" "))
        if I18n.exists?("jqac2.validations.hints.#{vtype}") && options[:disable_hints] != true
          data_messages << I18n.t("jqac2.validations.hints.#{vtype}")
        end
      elsif vtype.nil?
        options
      else
        raise ArgumentError, "Validation of type #{vtype} is not known"
      end
    end

    if data_messages.any?
      current_data_attributes.merge!(validation_messages: data_messages.compact.join(";"))
    end

    return options.merge(data: current_data_attributes)
  end

  def jqac2_validation_class_for(*vtypes)
    css = []
    vtypes.each do |vtype|
      if !vtype.nil?
        if JqajaxCore2::Validations.settings[vtype.to_sym]
          css << JqajaxCore2::Validations.settings[vtype.to_sym][:class]
        else
          raise ArgumentError, "Validation of type #{vtype} is not known"
        end
      end
    end

    return css.join(" ")
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