class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :finish_date, :all_date, :content))
    if @task.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      flash.now[:alert] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :finish_date,:all_date, :content))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash.now[:alert] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end

end
