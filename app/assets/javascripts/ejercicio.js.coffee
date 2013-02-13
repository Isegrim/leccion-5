# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  objectItemList = new Array()
  BdItemList = new Array()
  
  ############## Bloques ##############
  
  #### constructor para objetos de bd y ul ####
  itemList = (id,sentencia) ->
    @id = id
    @sentencia = sentencia
  
  #### crear arreglo con la cantidad de objetos actual en una ul ####
  updateList = ->
    objectItemList = []
    $("#sortable li").each (index) ->
      objectItemList[index]=new itemList(parseInt($(this).attr("id")),$(this).text())
  
  #### Imprimir datos de arreglos de objetos ####
  printList = (item) ->
    console.log item.id+" : "+item.sentencia
  
  accessor = (objectArray)->
    length = objectArray.length 
    i = 0
    while i < length
      console.log printList objectArray[i]
      i++
  
  ##### inserta dentro de un arreglo objetos con key y valor del campo sentencia de la BD####
  BdLIst = ->
    length = gon.valores.length
    i = 0
    while i < length
      BdItemList[i] = new itemList(gon.valores[i],gon.palabras[i])
      i++
 
  inputSentence = (sentence) ->
    @sentencia = sentence
    @id = ""
    
  obj = new inputSentence(sentencia)  
  
  #ArrayValues = (objArray) ->
  #  i = 0
  #  currentArray = new Array()
  #  ValuesObjArray = new Array()
  #  for currentArray[i++] of objArray
  #    lastItem = currentArray.length - 1
  #    ValuesObjArray.push objArray[currentArray[lastItem]]

  obj.setId = (id) ->
    @id = id

  obj.search = (objArray) ->
    _.each objArray, (key, value) ->
      if value is @sentencia
        obj.setId key
      else
        console.log "Error al asignar id"


  obj.evaluate = ->
    #console.log "sentencia encontrada en ul?: "+includeOIList = _.include(ArrayValues(objectItemList), @sentencia)
    #console.log "sentencia encontrada en BD?: "+includeBdIList = _.include(ArrayValues(BdItemList), @sentencia)
    if includeOIList is false and includeBdIList
      obj.search BdItemList
      console.log printList(obj)
    else if includeBdIList
      console.log "Sentencia Incorrecta para este ejercicio"
    else if includeOIList
      console.log "Sentencia repetida"
    else
      console.log "Error en evaluate()"
  
  ############## Edit Element ##############  
  
  $('.ui-state-default').dblclick ->
    currentId = $(this).attr("id")
    $("#" + currentId).remove()
    updateList()
    accessor(objectItemList)
    
  ############## Comparar Sentencia ##############
  $("#listo").click ->
    sentencia = document.getElementById('sentencia').value
    updateList()
    BdLIst()
    inputSentence(sentencia)
    obj.evaluate()
      
 
  $("#link-instrucciones").click ->
    contenidoInst='<div class="panel callout radius">'
    contenidoInst+='<h5>INSTRUCCIONES</h5>'
    contenidoInst+='<ul>'
    contenidoInst+='<li>Escribir una nueva sentencia para completar el codigo, si es necesario.</li>'
    contenidoInst+='<li>Arrastrar la nueva sentencia a la lista de la izquierda.</li>'
    contenidoInst+='<li>Arrastrar la nueva sentencia a la lista de la izquierda.</li>'
    contenidoInst+='<li>Ordenar la lista de elementos de forma correcta para que el bloque de codigo funcione.</li>'
    contenidoInst+='</ul>'
    contenidoInst+='</div>'
    $("#contenidos").html contenidoInst
                
  $("#link-ejer1").click ->
    DebugEjer1='<div class="panel callout radius">'
    DebugEjer1+='<p>'
    DebugEjer1+='DEBUG EJER 1.1'
    DebugEjer1+='</p>'
    DebugEjer1+='</div>'
    $("#contenidos").html DebugEjer1
  
  $("#link-ejer2").click ->
    DebugEjer2='<div class="panel callout radius">'
    DebugEjer2+='<p>'
    DebugEjer2+='DEBUG EJER 1.2'
    DebugEjer2+='</p>'
    DebugEjer2+='</div>'
    $("#contenidos").html DebugEjer2
  
  $("#link-ejer3").click ->
    DebugEjer3='<div class="panel callout radius">'
    DebugEjer3+='<p>'
    DebugEjer3+='DEBUG EJER 1.3'
    DebugEjer3+='</p>'
    DebugEjer3+='</div>'
    $("#contenidos").html DebugEjer3
  
  ############## Eventos de Lista #### 
  #$("#sortable").sortable
   #axis:'y',
   # placeholder: 'ui-state-highlight',
   # containment:'ul',
   # items:'li',
   # cursor: 'move',
   # connectWith: ".sortable1",
   #update: ->
  $("#lista2").sortable
    axis:'y',
    placeholder: 'ui-state-highlight',
    containment:'ul',
    items:'li',
    cursor: 'move',
    #connectWith: ".sortable",
    pdate: ->
     ############   View Modal  ###########
    
     if _.isEqual(algo,BdItemList)
        $("#myModal").reveal
          animation: "fadeAndPop" #fade, fadeAndPop, none
          animationspeed: 100 #how fast animations are
          closeOnBackgroundClick: true #if you click background will modal close?
          dismissModalClass: "close-reveal-modal" #the class of a button or element that
      else
        
      ############ view Info ############
  

  
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
      
    
      
      
    
      
 