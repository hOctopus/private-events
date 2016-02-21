class EventsController < ApplicationController
  before_action :signed_in_user?, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def index
    if signed_in?
      @events = Event.all
    else
      redirect_to signin_path
    end 
  end

  def show
  end

  private

    def event_params
      params.require(:event).permit(:description, :location, :date)
    end
end