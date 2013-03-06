# coding: utf-8
class EventDatesController < ApplicationController
  before_filter :event_dateable

  def index
    @event_dates = @event_dateable.event_dates
  end

  def show
    @event_date = EventDate.find(params[:id])
  end

  def new
    @event_date = EventDate.new
  end

  def edit
    @event_date = EventDate.find(params[:id])
  end

  def create
    # @event_date = EventDate.new(params[:event_date])
    @event_date.event_dateable = @event_dateable

    # respond_to do |format|
    if @event_date.save
      redirect_to [@event_dateable, :event_dates], :notice => "Fecha de evento creada satisfactoriamente."
    else
      render action: "new"
    end
    # end
  end

  def update
    @event_date = EventDate.find(params[:id])
    # respond_to do |format|
    if @event_date.update_attributes(params[:event_date])
      redirect_to [@event_dateable, :event_dates], notice: 'Event date was successfully updated.'
    else
      render action: "edit"
    end
    # end
  end

  def destroy
    @event_date = EventDate.find(params[:id])
    @event_date.destroy
    redirect_to [@event_dateable, :event_dates], :notice => "Fecha de evento eliminada satisfactoriamente."
  end

  private
    def event_dateable
      @event_dateable = nil
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @event_dateable = $1.classify.constantize.find(value)
        end
      end
    end

end
