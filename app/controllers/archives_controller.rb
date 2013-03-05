# coding: utf-8
class ArchivesController < ApplicationController
  def index
    @archives = Archive.order("id desc")

    respond_to do |format|
      format.js
      format.html # index.html.erb
    end
  end

  def show
    @archive = Archive.find(params[:id])

  end

  def new
    @archive = Archive.new

  end

  def edit
    @archive = Archive.find(params[:id])
  end

  def create
    @archive = Archive.new(params[:archive])

    respond_to do |format|
      if @archive.save
        format.js
        format.html { redirect_to archives_url, notice: 'Archive was successfully created.' }
      else
        format.js { render :action => "new" }
        format.html { render action: "new" }
      end
    end
  end

  def update
    @archive = Archive.find(params[:id])

    respond_to do |format|
      if @archive.update_attributes(params[:archive])
        format.js
        format.html { redirect_to archives_url, notice: 'Archive was successfully updated.' }
      else
        format.js {render :action => "edit", :alert => "Error #{@archive.errors.full_messages.map{|e| e}.join(", ")}"}
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy
    @archives = Archive.all

    respond_to do |format|
      format.js
      format.html { redirect_to archives_url }
    end
  end
end
