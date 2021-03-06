# coding: utf-8
class NoticesController < ApplicationController
  load_and_authorize_resource
  # GET /notices
  # GET /notices.json
  def index
    unless user_signed_in? and current_user.admin?
      @notices = Notice.paginate :page => params[:page] || 1, :per_page =>5
    else
      @notices = Notice.published.paginate :page => params[:page] || 1, :per_page =>5
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notices }
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notice }
    end
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @notice = Notice.new
    @archives = Archive.order("id desc").paginate :page => params[:page] || 1, :per_page => 8

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notice }
    end
  end

  # GET /notices/1/edit
  def edit
    @notice = Notice.find(params[:id])
    @archives = Archive.order("id desc").paginate :page => params[:page] || 1, :per_page => 8
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(params[:notice])

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: 'Noticia creada satisfactoriamente.' }
        format.json { render json: @notice, status: :created, location: @notice }
      else
        format.html { render action: "new" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notices/1
  # PUT /notices/1.json
  def update
    @notice = Notice.find(params[:id])

    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        format.html { redirect_to @notice, notice: 'Noticia creada satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to notices_url }
      format.json { head :no_content }
    end
  end
end
