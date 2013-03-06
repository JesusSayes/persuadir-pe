# coding: utf-8
class WorkshopsController < ApplicationController
  load_and_authorize_resource
  def index
    @workshops = Workshop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workshops }
    end
  end

  def show
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workshop }
    end
  end

  def new
    @workshop = Workshop.new
    @page_ancestry = ancestry_options(Page.scoped.arrange(:order => 'title')) {|i| "#{'--' * i.depth} #{i.title}" }
    @archives = Archive.order("id desc").paginate :page => params[:page] || 1, :per_page => 8

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workshop }
    end
  end

  def edit
    @workshop = Workshop.find(params[:id])
    @page_ancestry = ancestry_options(Page.scoped.arrange(:order => 'title')) {|i| "#{'--' * i.depth} #{i.title}" }
    @archives = Archive.order("id desc").paginate :page => params[:page] || 1, :per_page => 8
  end

  def create
    @workshop = Workshop.new(params[:workshop])

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: 'El taller/charla fue creado satisfactoriamente.' }
        format.json { render json: @workshop, status: :created, location: @workshop }
      else
        format.html { render action: "new" }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      if @workshop.update_attributes(params[:workshop])
        format.html { redirect_to @workshop, notice: 'El taller/charla fue creado satisfactoriamente. ' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy

    respond_to do |format|
      format.html { redirect_to workshops_url }
      format.json { head :no_content }
    end
  end
end
