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



$("#slides").slides
  preload: true
  preloadImage: "loading.gif"
  play: 5000
  pause: 2500
  hoverPause: true