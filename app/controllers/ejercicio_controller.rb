class EjercicioController < ApplicationController
  def home
    @random=Array.new
    @valores=Array.new
    @palabras=Array.new
    @sentencia=Sentencias.all
    @random=@sentencia.to_a.shuffle
    gon.valores=@valores
    gon.palabras=@palabras
    @sentencia.each do |p|
      gon.valores << p.id
      gon.palabras << p.palabras
    end
    
  end
end
