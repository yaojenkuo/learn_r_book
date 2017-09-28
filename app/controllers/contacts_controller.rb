class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
            flash.now[:error] = nil
        else
            flash.now[:error] = '訊息傳送失敗'
            render :new
        end
    end
end
