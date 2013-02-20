# coding: utf-8
class ImagesController < ApplicationController
  load_and_authorize_resource :image
  before_filter :imageable

  def index
    @images = @imageable.images
  end

  def show
    # @image = Image.find(params[:id])
  end

  def new
    # @image = Image.new
  end

  def edit
    # @image = Image.find(params[:id])
  end

  def create
    @image.user = current_user
    @image.imageable = @imageable

    if @image.save
      redirect_to @imageable, notice: 'Image was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @image.update_attributes(params[:image])
      redirect_to [@imageable, :images], notice: 'Image was successfully updated.'
    else
      render action: "edit"
    end
  end

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
