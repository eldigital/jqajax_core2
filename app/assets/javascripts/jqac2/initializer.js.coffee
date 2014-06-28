window.JqAjaxCore2.Initializer =
  initJqAc2: ->
    JqAjaxCore2.Core.initDefaultLink()
    JqAjaxCore2.Core.initSelectOnchange()

$(document).ready(JqAjaxCore2.Initializer.initJqAc2)
$(document).on('page:load', JqAjaxCore2.Initializer.initJqAc2)    