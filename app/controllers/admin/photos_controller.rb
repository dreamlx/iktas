class Admin::PhotosController < ApplicationController
  layout 'admin'
  before_action :set_admin_photo, only: [:show, :edit, :update, :destroy,:changesign]

  # GET /admin/photos
  # GET /admin/photos.json
  def index
    @admin_photos = Admin::Photo.all.page(params[:page]).per(4)
  end

  # GET /admin/photos/1
  # GET /admin/photos/1.json
  def show
  end

  # GET /admin/photos/new
  def new
    @admin_photo = Admin::Photo.new
  end

  # GET /admin/photos/1/edit
  def edit
  end

  # POST /admin/photos
  # POST /admin/photos.json
  def create
    @admin_photo = Admin::Photo.new(admin_photo_params)

    respond_to do |format|
      if @admin_photo.save
        format.html { redirect_to @admin_photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/photos/1
  # PATCH/PUT /admin/photos/1.json
  def update
    respond_to do |format|
      if @admin_photo.update(admin_photo_params)
        format.html { redirect_to @admin_photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/photos/1
  # DELETE /admin/photos/1.json
  def destroy
    @admin_photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_photos_url }
      format.json { head :no_content }
    end
  end
  def changesign
    if @admin_photo.sign
      @admin_photo.sign=false
    else
      @admin_photo.sign=true
    end

    respond_to do |format|
      @admin_photo.save      
      format.html { redirect_to admin_photos_url }
      format.json { head :no_content }
    end 
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_photo
      @admin_photo = Admin::Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_photo_params
      params.require(:admin_photo).permit(:sign,:avatar)
    end
end
