class EventsController < ApplicationController
  before_action :signed_in_user?, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      @event.attend_event(@event.creator)
      flash[:success] = "Event created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def index
    if signed_in?
      @past_events    = Event.past.paginate(page: params[:page], per_page: 3)
                                  .order(created_at: :desc)
      @future_events  = Event.future.paginate(page: params[:page], per_page: 3)
                                  .order(created_at: :desc)
    else
      redirect_to signin_path
    end
  end

  def show
  end

  def attending
    event = Event.find_by_id(params[:event_id])
    event.attend_event(current_user.id)
    flash[:success] = "You are attending #{event.title}!"
    redirect_to root_url
  end

  def declining
    event = Event.find_by_id(params[:event_id])
    event.decline_event(current_user.id)
    flash[:success] = "You are no longer attending #{event.title}!"
    redirect_to root_url
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :location, :date)
    end
end
