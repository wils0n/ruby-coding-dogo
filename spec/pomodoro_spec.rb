require "minitest/autorun"
require_relative "../lib/pomodoro"

describe Pomodoro do
  it "#create pomodoro" do
    #man = Man.nev("Joe") #error
    pomodoro = Pomodoro.new()
    pomodoro.duracion.must_equal 25
  end
  it "#create pomodo con cualquier duracion" do
  	pomodoro=Pomodoro.new(30)
  	pomodoro.duracion.must_equal 30
  end

  it "#pomodoro creado inicia stop" do 
  	pomodoro = Pomodoro.new()
  	pomodoro.state.must_equal "parado"
  end

  it "#count down" do
    pomodoro = Pomodoro.new(25)
    #pomodoro.start().must_equal 25
    pomodoro.time().must_equal 25
  end
  
  it "#un pomodoro no termina si no ha sido arrancado previamente" do
    pomodoro = Pomodoro.new(2)
    sleep(2)
    pomodoro.state().wont_be_same_as "terminado"
  end

  it "#un pomodoro acaba cuando acaba su tiempo" do
    pomodoro = Pomodoro.new(2)
    pomodoro.start
    sleep(2)
    pomodoro.state.must_equal "terminado"
  end  

  it "#un pomodoro NO acaba  mientras no acaba su tiempo" do
    pomodoro = Pomodoro.new(5)
    pomodoro.start
    sleep(2)
    pomodoro.state.wont_be_same_as "terminado"
  end

end