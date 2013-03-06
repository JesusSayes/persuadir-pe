class ConsultantsController < ApplicationController
  def index
    @consultants = Consultant.published

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultants }
    end
  end

  def consultants_list
    @consultants = Consultant.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultants }
    end
  end

  def show
    @consultant = Consultant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consultant }
    end
  end

  def new
    @consultant = Consultant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consultant }
    end
  end

  def edit
    @consultant = Consultant.find(params[:id])
  end

  def create
    @consultant = Consultant.new(params[:consultant])

    respond_to do |format|
      if @consultant.save
        format.html { redirect_to @consultant, notice: 'Consultor creado satisfactoriamente.' }
        format.json { render json: @consultant, status: :created, location: @consultant }
      else
        format.html { render action: "new" }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @consultant = Consultant.find(params[:id])

    respond_to do |format|
      if @consultant.update_attributes(params[:consultant])
        format.html { redirect_to @consultant, notice: 'Consultor actualizado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @consultant = Consultant.find(params[:id])
    @consultant.destroy

    respond_to do |format|
      format.html { redirect_to consultants_url }
      format.json { head :no_content }
    end
  end
end
