class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new event_params

        if @event.save
            redirect_to events_path, notice: "成功儲存！"
        else
            render 'new', notice: "儲存失敗:("
        end
    end

    def show
    end

    def edit
    end

    def update
        if @event.update event_params
            redirect_to events_path, notice: "成功儲存！"
        else
            render 'edit', notice: "儲存失敗:("
        end
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end
    
    private
    def event_params
        params.require(:event).permit(:title, :link)
    end

    def find_event
        @event = Event.find(params[:id])
    end
end
