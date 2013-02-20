# coding: utf-8
class ImagesController < ApplicationController
  load_and_authorize_resource :image
  before_filter :imageable
  # GET /images
  # GET /images.json
  def index
    @images = @imageable.images
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    # @image = Image.new
  end

  # GET /images/1/edit
  def edit
    # @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image.user = current_user
    @image.imageable = @imageable

    if @image.save
      redirect_to @imageable, notice: 'Image was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    if @image.update_attributes(params[:image])
      redirect_to [@imageable, :images], notice: 'Image was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    redirect_to [@imageable], notice: "Image destroyed"
  end

  private
    def imageable
      @imaginable = nil
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @imageable = $1.classify.constantize.find(value)
        end
      end
    end

end
