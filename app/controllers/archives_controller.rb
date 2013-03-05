# coding: utf-8
class ArchivesController < ApplicationController
  def index
    @archives = Archive.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @archives }
    end
  end

  def show
    @archive = Archive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @archive }
    end
  end

  def new
    @archive = Archive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @archive }
    end
  end

  def edit
    @archive = Archive.find(params[:id])
  end

  def create
    @archive = Archive.new(params[:archive])

    respond_to do |format|
      if @archive.save
        format.html { redirect_to @archive, notice: 'Archive was successfully created.' }
        format.json { render json: @archive, status: :created, location: @archive }
      else
        format.html { render action: "new" }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @archive = Archive.find(params[:id])

    respond_to do |format|
      if @archive.update_attributes(params[:archive])
        format.html { redirect_to @archive, notice: 'Archive was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy

    respond_to do |format|
      format.html { redirect_to archives_url }
      format.json { head :no_content }
    end
  end
end
