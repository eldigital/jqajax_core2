# -*- encoding : utf-8 -*-
require "jqajax_core2/config"
require "jqajax_core2/engine"
require "jqajax_core2/application_controller_ext"

ActionController::Base.send(:include, JqajaxCore2::ApplicationControllerExt)


