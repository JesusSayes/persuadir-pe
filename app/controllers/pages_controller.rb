# coding: utf-8
class PagesController < ApplicationController
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  def new
    @page = Page.new
    @page_ancestry = ancestry_options(Page.scoped.arrange(:order => 'title')) {|i| "#{'--' * i.depth} #{i.title}" }
    @archives = Archive.order("id desc")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_ancestry = ancestry_options(Page.scoped.arrange(:order => 'title')) {|i| "#{'--' * i.depth} #{i.title}" }
    @archives = Archive.order("id desc")
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  def up
    @page= Page.find(params[:id])
    Page.move_higher @page, true # true ancestry
    respond_to do |format|
      format.js
      format.html { redirect_to pages_path, notice: "\"#{@page.title}\" subió un lugar"}
    end
  end

  def down
    @page= Page.find(params[:id])
    Page.move_lower @page, true # true ancestry
    respond_to do |format|
      format.js
      format.html { redirect_to pages_path, notice: "\"#{@page.title}\" bajó un lugar"}
    end
  end
end
