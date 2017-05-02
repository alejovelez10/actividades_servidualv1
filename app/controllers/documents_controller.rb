class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
 

@size = 0
#Document.all.each do |doc|
  @size = Document.first.anexo.size + @size
  #end 

  if current_user.rol.doc_admin || current_user.rol.director 

if params[:search] || params[:search1] || params[:search2]
    @documents1 = Document.search(params[:search],params[:search1],params[:search2])
   
else
@documents1 = Document.all
end
      
    

      else
if params[:search] || params[:search1] || params[:search2]

@documents1 = Document.where(user_id: current_user.id).search(params[:search],params[:search1],params[:search2])
 else
  @documents1 = Document.where(user_id: current_user.id).paginate(page: params[:page],:per_page => 30)
end

      end

@documents = @documents1.paginate(page: params[:page],:per_page => 30)
@route = documents_path

    
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
      @documents = DocumentType.all

   @arr  = Codigo.all 
    

#puts bod

  end

  # GET /documents/1/edit
  def edit
     @documents = DocumentType.all

   @arr  = Codigo.all 
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
@documents = DocumentType.all
@arr  = Codigo.all 
 

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: 'El Documento fue creado exitosamente' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, :params => { :documents => @documents   } }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to documents_path, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def create_document
  
   a =  DocumentType.new(nombre:params[:nombre],user_id:current_user.id, codigo:params[:codigo], frecuencia:params[:frecuencia])
   a.save
   @documents = DocumentType.all



end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:obra, :user_id, :document_date, :anexo, :document_type_id, :sub_document_type_id, :description)
    end
end
