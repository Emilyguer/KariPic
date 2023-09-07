class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]
  before_action :authenticate_user! # Asegura que el usuario esté autenticado

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    if current_user.admin? # Verifica si el usuario tiene el rol 'admin'
    @photo = Photo.new
  else
    flash[:alert] = "Solo los administradores pueden subir fotos."
    redirect_to root_path # Redirige a la página principal si el usuario no es un administrador
  end
end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
        if current_user.admin? # Verifica si el usuario tiene el rol 'admin'
          @photo = Photo.new(photo_params)
        if @photo.save
          redirect_to @photo, notice: 'La foto se ha subido exitosamente.'
        else
          render 'new'
        end
      else
        flash[:alert] = 'Solo los administradores pueden subir fotos.'
        redirect_to root_path
      end
    end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photo_url(@photo), notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:title, :description, :image, :user_id)
    end
end
