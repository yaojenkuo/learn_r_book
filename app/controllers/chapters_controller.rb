class ChaptersController < ApplicationController
    before_action :find_chapter, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @chapters = Chapter.all
    end

    def new
        @chapter = Chapter.new
    end

    def create
        @chapter = Chapter.new(chapter_params)

        if @chapter.save
            redirect_to @chapter, notice: "成功儲存！"
        else
            render 'new', notice: "儲存失敗:("
        end
    end

    def show
    end

    def edit
    end

    def update
        if @chapter.update chapter_params
            redirect_to @chapter, notice: "成功儲存！"
        else
            render 'edit', notice: "儲存失敗:("
        end
    end

    def destroy
        @chapter.destroy
        redirect_to chapters_path
    end

    private
    def chapter_params
        params.require(:chapter).permit(:title, :content)
    end

    def find_chapter
        @chapter = Chapter.find(params[:id])
    end
end
