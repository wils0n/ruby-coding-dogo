class Pomodoro
	#attr_reader :duracion

	  def initialize(duration=25)
    	@duracion=duration
      @time = duracion
      @estado="parado"
  	end
  	def duracion
  		@duracion
  	end

  	def state()
      @estado
  	end

    def start
      thr = Thread.new { 
        while @time>0
          @time=@time-1
        end
        @estado="terminado"
      }
      # t = Thread.new do
      #   "ha iniciado  la cuenta atras"
      # end
      thr.join            
    end

    def time
      @time
    end
end
