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

  task codigos: :environment do
      Codigo.destroy_all
      response = HTTParty.get('https://creator.zoho.com/api/json/erp-servidual-ltda1/view/PLANILLA_UNIFICADA_TODOS?authtoken=8e7d9b1a50d940bf61830620b3a505af&zc_ownername=alejovm10&scope=creatorapi&A_O=2016')
      bod = response.body.sub('var zohoalejovm10view2432 =', '')
      bod = bod.gsub(';', '')
      bod  = JSON.parse bod
      bod = bod["S_Codigo"]
      @arr  = Array.new
      bod.each do |value|
      Codigo.create(consecutivo: value["Consecutivo1"], nombre_proyecto: value["N_Cotizacion1"],codigo_completo: value["C_Completo"]) 
     
      end
      response = HTTParty.get('https://creator.zoho.com/api/json/erp-servidual-ltda1/view/PLANILLA_UNIFICADA_TODOS?authtoken=8e7d9b1a50d940bf61830620b3a505af&zc_ownername=alejovm10&scope=creatorapi&A_O=2017')
      bod = response.body.sub('var zohoalejovm10view2432 =', '')
      bod = bod.gsub(';', '')
      bod  = JSON.parse bod
      bod = bod["S_Codigo"]
      @arr  = Array.new
      bod.each do |value|
      Codigo.create(consecutivo: value["Consecutivo1"], nombre_proyecto: value["N_Cotizacion1"],codigo_completo: value["C_Completo"]) 
     
      end

  end

end





       