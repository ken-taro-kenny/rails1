class SchedulesController < ApplicationController
    
  def index
    @schedules = Schedule.paginate(page: params[:page], per_page: 5)
    
    require 'date'
    d = Date.today
    @today = d.strftime("%Y年%m月%d日")
  end
  
  def new
    @schedule = Schedule.new
    
    require 'date'
    d = Date.today
    @today = d.strftime("%Y年%m月%d日")
  end
 
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :detail))
    if @schedule.save
      flash[:notice] = "スケジュールを新規作成しました"
      redirect_to :schedules
    else
      render "new"
    end
  end
 
  def show
    @schedule = Schedule.find(params[:id])
    
    require 'date'
    d = Date.today
    @today = d.strftime("%Y年%m月%d日")
  end
 
  def edit
    @schedule = Schedule.find(params[:id])
    
    require 'date'
    d = Date.today
    @today = d.strftime("%Y年%m月%d日")
  end
 
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :detail))
      flash[:notice] = "スケジュールID「#{@schedule.id}」の情報を更新しました"
      redirect_to :schedules
    else
      render "edit"
    end
  end
 
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
  
end
