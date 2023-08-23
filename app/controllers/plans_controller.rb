class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plan = Plan.new
  end

  def new
    @plan = Plan.new
  end

  def destroy
    @plan = Plan.find(params[:id])
    if @plan.destroy
      redirect_to plans_path, notice:"削除しました"
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    Plan.create(plan_parameter)
    redirect_to plans_path
  end


  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_parameter)
      redirect_to plans_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def plan_parameter
    params.require(:plan).permit(:title, :content, :start_time)
  end
end
