class ActividadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_actividad, only: [:show, :edit, :update, :destroy]

  # GET /actividads
  # GET /actividads.json
    def index
    if current_user.rol == "Admin"
    @actividads = Actividad.where(estado_cierre: false).order(created_at: :desc)
    @tipo = "Todas las Actividades"
    @resp = "n/a"
  else
    redirect_to get_act_path
  end


  end
   def get_act
     @actividads = Actividad.where(responsable_id: current_user.id).where(estado_envio: true).where(estado_cierre: false).order(created_at: :desc)
  
    @tipo = "Mis Actividades"
    @resp = "resp"
    render "index"
  end
    def invitado

     @actividads = current_user.actividads.where(estado_envio: true).where(estado_cierre: false).order(created_at: :desc)
    @tipo = "Actividades Invitado"
    @resp = "n/a"
    render "index"
  end

 def set_act
    if current_user.rol == "Director" ||  current_user.rol == "Admin"
    @actividads = Actividad.where(user_id: current_user.id).where(estado_cierre: false).order(created_at: :desc)
     @tipo = "Actividades que asigne"
     @resp = "asig"
      else
    redirect_to get_act_path
   
  end
render "index"
end

def show
  end

  def new
    @actividad = Actividad.new
  end
  # GET /actividads/1/edit
  def edit
  end

  # POST /actividads
  # POST /actividads.json
  def create
    @actividad = Actividad.new(actividad_params)
    @actividad.estado_cierre  = false
    num = Actividad.where(tipo: @actividad.tipo).maximum(:consecutivo)
    if num != nil
        num = num + 1

    else
        num = 1001
    end
    ano = Time.now.year.to_s
    ano = ano.remove("20") 

    tipo = get_tipo(@actividad.tipo)
    code= "#{tipo}-#{num}-#{ano}" 
    @actividad.codigo= code
    @actividad.consecutivo = num
    @actividad.balon = "responsable"
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
      params.require(:actividad).permit(:consecutivo, :tipo, :user_id, :prioridad, :responsable_id, :nombre, :descripcion, :anexo, :f_entrega, :porcentaje, :estado_envio, :contador, :codigo, :e_vencimiento, :user_ids => [])
    end
end
