

module ApplicationHelper

	def get_estado(x)
		x == true ? "Cerrada" : "Abierta"
		
	end

    def get_envio(x)
        x == true ? "Si" : "No"
        
    end


 def get_venci(x)
    if x == "Vigente"
        
            "vigentet"

    elsif x == "Proxima a Vencer"

            "proximat"

    elsif x == "Vencida"

            "vencidat"
    end
            
                
    end

def get_date(fecha)
   
if fecha != nil

    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "Enero", "02" => "Febrero","03"=>"Marzo","04" => "Abril", "05" => "Mayo","06"=> "Junio" ,"07"=> "Julio", "08" => "Agosto", "09"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    return  dm + " " + meses[m] + ", " + y 
#dias[ds] + ", " + 
end
end

end



