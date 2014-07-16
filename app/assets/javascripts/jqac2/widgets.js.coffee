window.JqAjaxCore2.Widgets = 
  initSlidedownBoxes: ->
    boxes = $(".js-slide-down-box.plain")
  
    boxes.each ->
      ident = JqAjaxCore2.Helpers.randomString()

      $(this).removeClass("plain")
      $(this).addClass(ident)
      btn   = $($(this).children(".js-slidedown-button")[0])
      cont  = $($(this).children(".js-slidedown-content")[0])
    
      btn.addClass(ident)
      cont.addClass(ident)
    
      btn = $(".js-slidedown-button."+ident)
    
      btn.bind "click", ->
        x = $(this).attr('class').split(' ')
        btn_ident = x[x.length-1]
        cont  = $(".js-slidedown-content."+btn_ident)
        
        box = $(".js-slide-down-box."+btn_ident)
        
        session_id = box.attr("data-session-id")
        $(box).toggleClass("open")
