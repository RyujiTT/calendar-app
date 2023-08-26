class PlansController < ApplicationController
  def index
    @plans = Plan.all.order("plans.start_time ASC")
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
    @plans = Plan.all.order("plans.start_time ASC")
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      @plans = Plan.all.order("plans.start_time ASC")
      render 'index'
    end
  end


  def edit
    @plan = Plan.find(params[:id])
    @plans = Plan.all.order("plans.start_time ASC")
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content, :start_time)
  end
end
