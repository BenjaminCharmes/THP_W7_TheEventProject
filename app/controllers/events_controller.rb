class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    event = params[:event]
    @new_event = Event.new(
      start_date: event[:start_date],
      duration: event[:duration].to_i,
      title: event[:title],
      description: event[:description],
      price: event[:price].to_i,
      location: event[:location],
      admin: current_user
    )

    if @new_event.save
      redirect_to @new_event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

end
