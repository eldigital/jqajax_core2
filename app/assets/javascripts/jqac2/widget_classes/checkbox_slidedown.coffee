class JqAjaxCore2.CheckboxSlidedown
  constructor: (el) ->
    @$el = $(el)

    @settings =
      content_selector: @$el.data("jqac2-checkbox-slidedown-content")
      trigger_selector: @$el.data("jqac2-checkbox-slidedown-trigger")
      open: @$el.data("jqac2-checkbox-slidedown-open") || 'false'

    @$content = @$el.find(@settings.content_selector)
    @$trigger = @$el.find(@settings.trigger_selector)

    @element_id = "s" + Math.random()+Math.random()

    @$checkbox = $('<input id=" ' + @element_id  + ' " class="jqac2-checkbox-slidedown-trigger" type="checkbox"></input>')

  init: ->
    # content should be hidden until checkbox was checked
    @$content.hide()

    # Add checkbox before the trigger element
    @$trigger.before(@$checkbox)
    @$checkbox.on 'change', @setContentVisibility

    @setContentVisibility


  setContentVisibility: =>
    if @$checkbox.is(":checked")
      @$content.show()
    else
      @$content.hide()

