namespace :email do
  desc "Sends the most voted products created yesterday"
  task vencimiento: :environment do
    #ReportMailer.noty_report(Employed.last, Report.first).deliver_now
    Actividad.where(estado_cierre: false).each do |actividad|
        
          user = User.find(actividad.responsable_id)
        times = actividad.f_entrega.to_time
        time =  times.to_i - Time.now.to_i
        actividad.contador = (time / 60 / 60/ 24) + 1
        actividad.save

            if actividad.contador < 5 && actividad.contador > 0
            actividad.e_vencimiento = "Proxima a Vencer"
            #ActividadMailer.noty_report(user,actividad, "proximo").deliver
            
        elsif actividad.contador < 0

            #ActividadMailer.noty_report(user,actividad,"vencido").deliver
              actividad.e_vencimiento = "Vencida"
        elsif actividad.contador == 0
            actividad.e_vencimiento = "Proxima a Vencer"
            #ActividadMailer.noty_report(user,actividad, "hoy").deliver

        end
actividad.save
    end 
  end

end




       