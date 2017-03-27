class ActividadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_actividad, only: [:show, :edit, :update, :destroy]

  # GET /actividads
  # GET /actividads.json

 respond_to :json
  def get_events
if current_user.rol.act_admin
    @task = Actividad.all
    events = []
    @task.each do |task|
      if task.e_vencimiento == "Vigente"
        @color = "green"
      elsif task.e_vencimiento == "Proxima a Vencer"

      @color = "orange" 
      else
        
          @color = "red"
      end
      events << {:id => task.id, :title => "#{task.nombre} ", :start => "#{task.f_entrega}" , :color => "#{@color}"}
    end
    render :text => events.to_json

else

 
    @task = Actividad.where(responsable_id: current_user.id)
    events = []
    @task.each do |task|
      if task.e_vencimiento == "Vigente"
        @color = "green"
      else
          @color = "red"
      end
      events << {:id => task.id, :title => "#{task.nombre} ", :start => "#{task.f_entrega}" , :color => "#{@color}"}
    end
    render :text => events.to_json
end


  end




def user_actividades

if params[:search] || params[:search1] || params[:search2]
    @actividads = Actividad.estado_f.where(responsable_id:params[:user]).search(params[:search],params[:search1],params[:search2])
  else
      @actividads = Actividad.estado_f.where(responsable_id:params[:user])
  end
user = User.find(params[:user])
    @tipo = "#{user.nombres} #{user.apellidos}"
    @resp = "n/a"
    @route = user_actividades_path
render "index"

end


def actividades_cerradas

if params[:search] || params[:search1] || params[:search2]
  
  if current_user.rol.act_admin

    @actividads = Actividad.where(estado_cierre: true).search(params[:search],params[:search1],params[:search2])
  elsif current_user.rol.act_director
      
    @actividads = Actividad.where(estado_cierre: true).where(user_id: current_user.id).or(where(responsable_id: current_user.id)).search(params[:search],params[:search1],params[:search2])


    else
     @actividads = Actividad.where(estado_cierre: true).where(responsable_id: current_user.id).search(params[:search],params[:search1],params[:search2])


     end

  else
      @actividads = Actividad.where(estado_cierre: true)
  end


    @tipo = "Actividades Cerradas"
    @resp = "n/a"
    @route = actividades_cerradas_path
render "index"

end




def usuarios
@users = User.all


end












    def index
    if current_user.rol.act_admin

    
    if params[:search] || params[:search1] || params[:search2]
    @actividads = Actividad.estado_f.search(params[:search],params[:search1],params[:search2])
  else
      @actividads = Actividad.estado_f
  end

    @tipo = "Todas las Actividades"
    @resp = "n/a"
    @route = actividads_path
  else
    redirect_to get_act_path
  end


  end
   def get_act
    if params[:search] || params[:search1] || params[:search2]
           @actividads = Actividad.where(responsable_id: current_user.id).estado_f.search(params[:search],params[:search1],params[:search2])
  else
           @actividads = Actividad.where(responsable_id: current_user.id).estado_f

  end
    @tipo = "Mis Actividades"
    @resp = "resp"
    @route = get_act_path
    render "index"
  end




    def invitado
 if params[:search] || params[:search1] || params[:search2]
     @actividads = current_user.actividads.where(estado_envio: true).estado_f.search(params[:search],params[:search1],params[:search2])
   else 
     @actividads = current_user.actividads.where(estado_envio: true).estado_f
    end
    @tipo = "Actividades Invitado"
    @resp = "n/a"
    @route = invitado_path
    render "index"

  end




 def set_act
    if current_user.rol.act_director ||  current_user.rol.act_admin
if params[:search] || params[:search1] || params[:search2]
    @actividads = Actividad.where(user_id: current_user.id).estado_f.search(params[:search],params[:search1],params[:search2])
     else
 @actividads = Actividad.where(user_id: current_user.id).estado_f
     end



     @tipo = "Actividades que asigne"
     @resp = "asig"
      @route = set_act_path
      else
    redirect_to get_act_path
   
  end
render "index"
end

def show
  end

  def new
    @actividad = Actividad.new


 #  console.log(zohoalejovm10view295.Lista_Empleados);
  #  $scope.nombre = zohoalejovm10view295.Lista_Empleados[0].NOMBRES;





end
  # GET /actividads/1/edit
  def edit
  end

  # POST /actividads
  # POST /actividads.json
  def create
    @actividad = Actividad.new(actividad_params)
    @actividad.estado_cierre  = false
    num = Actividad.maximum(:consecutivo)
    if num != nil
        num = num + 1

    else
        num = 1001
    end
    @actividad.consecutivo = num
    @actividad.balon = "responsable"
     @actividad.e_vencimiento = "Sin Enviar"
    respond_to do |format|
      if @actividad.save
        
        format.html { redirect_to @actividad, notice: 'Actvidad was successfully created.' }
        format.json { render :show, status: :created, location: @actvidad }
      else
        format.html { render :new }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividads/1
  # PATCH/PUT /actividads/1.json
  def update
    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to @actividad, notice: 'Actividad was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad }
      else
        format.html { render :edit }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividads/1
  # DELETE /actividads/1.json
  def destroy
    @actividad.destroy
    respond_to do |format|
      format.html { redirect_to actividads_url, notice: 'Actividad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



def new_seguimiento
  @actividad = Actividad.find(params[:actividad])
end

def create_seguimiento

  @seguimiento = Seguimiento.create(user_id:params[:user_id],actividad_id:params[:actividad_id],descripcion:params[:descripcion],porcentaje:params[:porcentaje],cierre:params[:cierre],anexo: params[:anexo])

if @seguimiento.save

redirect_to actividad_path(@seguimiento.actividad_id)

else
redirect_to root_path
  end
  end

private
def get_tipo(x)
    if x == "Actividad"
                "ACT"
    elsif x == "Peticion"
                   "PET" 
    elsif x == "Queja"
                "QUE"
    elsif x == "Reclamo"
                    "REC"
    elsif x == "Felicitaciones"
                    "FEL"
      elsif x == "Solicitud"
                    "SOL"

  end
end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad
      @actividad = Actividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_params
      params.require(:actividad).permit(:consecutivo, :tipo, :user_id, :balon,:prioridad, :responsable_id, :nombre, :descripcion, :anexo, :f_entrega, :porcentaje, :estado_envio, :contador, :codigo, :e_vencimiento, :user_ids => [])
    end
end



