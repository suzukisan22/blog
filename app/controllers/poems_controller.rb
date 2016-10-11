class PoemsController < ApplicationController
  before_action :set_poem, only: [:edit, :update, :destroy]

  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.where(status: 2)
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
    @poems = Poem.where(status: params[:id])
    if params[:id] == "1"
      @title = "下書き一覧"
    else
      @title = "論理削除一覧"
    end
  end

  # GET /poems/new
  def new
    @poem = Poem.new
  end

  # GET /poems/1/edit
  def edit
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = Poem.new(poem_params)
    if @poem.save
      if @poem.status == 2
        redirect_to root_path, notice: 'ブログが投稿されました'
      else
        redirect_to poem_path(1), notice: 'ブログが投稿されました'
      end
    else
      redirect_to new_poem_path, error: 'ブログの投稿に失敗しました'
    end

  end

  # PATCH/PUT /poems/1
  # PATCH/PUT /poems/1.json
  def update
    if @poem.update(poem_params)
      if @poem.status == 2
        redirect_to root_path, notice: 'ブログが更新されました'
      else
        redirect_to poem_path(1), notice: 'ブログが更新されました'
      end
    else
      redirect_to @poem, error: 'ブログの更新に失敗しました'
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem.update(status: 3)
    redirect_to poem_path(3), notice: "ブログが論理削除されました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_params
      params.require(:poem).permit(:title, :status)
    end
end
