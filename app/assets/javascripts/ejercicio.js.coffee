# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
    #ejercicio1

  #$(".lista2").sortable activate: (event, ui) ->
    #result = $('#lista2').sortable('toArray')
    #ides = $(this,result).attr("id")('toArray')
    #console.log ides
    
  $(document).ready ->
  
  # lista 1
  
  # lista2 
  
  # listas  
  deleteLista1 = ($item) ->
    $item.fadeOut ->
      $($item).appendTo($lista2).fadeIn()
    $item.fadeIn()
    
      
  deleteLista2 = ($item) ->
    $item.fadeOut ->
      $item.appendTo($lista1).fadeIn()
      

  $lista1 = $("#lista1")
  $lista2 = $("#lista2")
  
  $("li", $lista1).draggable
    revert: "invalid"
    helper: "clone"
    cursor: "move"

  #$lista1.droppable
  #  accept: "#lista2 li"
   # drop: (ev, ui) ->
    #  deleteLista2 ui.draggable
      
      

  #$("li", $lista2).draggable
  #  revert: "invalid"
   # helper: "clone"
   # cursor: "move"

  $lista2.droppable
    accept: "#lista1 > li"
    drop: (ev, ui) ->
      deleteLista1 ui.draggable
      #result = $('#lista2').sortable('toArray')
      ides = $(ui.draggable).attr("id")
      $(ui.draggable).addClass("ui-state-default")
      console.log ides
      
      #mandar a llamar metodo del cual guardará lo realizado por el usuario
      
(($, document, window, undefined_) ->
  "use strict"

  pfx = (->
  style = document.createElement("dummy").style
  prefixes = "Webkit Moz O ms Khtml".split(" ")
  memory = {}
  (prop) ->
    if typeof memory[prop] is "undefined"
      ucProp = prop.charAt(0).toUpperCase() + prop.substr(1)
      props = (prop + " " + prefixes.join(ucProp + " ") + ucProp).split(" ")
      memory[prop] = null
      for i of props
        if style[props[i]] isnt `undefined`
          memory[prop] = props[i]
          break
    memory[prop]
  )

  mapProperty = (name) ->
    return  unless name
    index = 1 + name.substr(1).search(/[A-Z]/)
    prefix = name.substr(0, index).toLowerCase()
    postfix = name.substr(index).toLowerCase()
    "-" + prefix + "-" + postfix
  addComma = (attribute) ->
    return ""  unless attribute
    attribute + ","

  defaults =
  
    # CLASSES 
    stepSelector: ".step"
    containerClass: ""
    canvasClass: ""
    areaClass: ""
    notSupportedClass: "not-supported"
    loadedClass: "loaded"
  
    # CONFIG 
    fullscreen: true
  
  # ANIMATION 
    animation:
      transformOrigin: "top left"
      transitionProperty: addComma(mapProperty(pfx("transform"))) + addComma(mapProperty(pfx("perspective"))) + "opacity"
      transitionDuration: "1s"
      transitionDelay: "500ms"
      transitionTimingFunction: "ease-in-out"
      transformStyle: "preserve-3d"

    transitionDuration: 1500
  
    # TEST 
    test: false

  callbacks =
    beforeChange: 1
    beforeInitStep: 1
    initStep: 1
    beforeInit: 1
    afterInit: 1
    beforeDeinit: 1
    afterDeinit: 1
    applyStep: 1
    unapplyStep: 1
    setInactive: 1
    beforeActive: 1
    setActive: 1
    selectInitialStep: 1
    selectPrev: 1
    selectNext: 1
    selectHome: 1
    selectEnd: 1
    loadStep: 1
    applyTarget: 1

  for callbackName of callbacks
    defaults[callbackName] = []



   ###
  Initialize jmpress
    ###
  init = (args) ->
    args = $.extend(true, {}, args or {})
  
   # accept functions and arrays of functions as callbacks
    callbackArgs = {}
    callbackName = null
    for callbackName of callbacks
      callbackArgs[callbackName] = (if $.isFunction(args[callbackName]) then [args[callbackName]] else args[callbackName])
      args[callbackName] = []
  
    # MERGE SETTINGS
    settings = $.extend(true, {}, defaults, args)
    for callbackName of callbacks
      Array::push.apply settings[callbackName], callbackArgs[callbackName]  if callbackArgs[callbackName]
  
    ###
    MEMBER VARS **
    ###
    jmpress = $(this)
    container = null
    area = null
    oldStyle =
      container: ""
      area: ""

    canvas = null
    current = null
    active = false
    activeSubstep = null
    activeDelegated = false 


  ###
   MEMBER FUNCTIONS **
    

    functions have to be called with this

    
  Init a single step

  @param element the element of the step
  @param idx number of step
  ###

  doStepInit = (element, idx) ->
    data = dataset(element)
    step = oldStyle: $(element).attr("style") or ""
    callbackData =
      data: data
      stepData: step

    callCallback.call this, "beforeInitStep", $(element), callbackData
    step.delegate = data.delegate
    callCallback.call this, "initStep", $(element), callbackData
    $(element).data "stepData", step
    $(element).attr "id", "step-" + (idx + 1)  unless $(element).attr("id")
      callCallback.call this, "applyStep", $(element), callbackData



) jQuery, document, window