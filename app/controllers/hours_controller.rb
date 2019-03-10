class HoursController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:create, :edit, :update, :destroy]
    before_action :set_hour, only: [:edit, :update, :destroy]

    def create
      @hour = @project.hours.build(hour_params)
      if @hour.save
        redirect_to @project, notice: 'Hours successfully created.'
      else
        redirect_to @project, notice: 'There was a problem.'
      end
    end

    def edit
    end

    def update
      if @hour.update(hour_params)
        redirect_to @project, notice: 'Hours successfully amended.'
      else
        redirect_to @project, notice: 'There was a problem.'
      end
    end

    def destroy
      @hour.destroy
      redirect_to @project, notice: 'Hours successfully removed.'
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_hour
      @hour = @project.hours.find(params[:id])
    end

    def hour_params
        params.require(:hour).permit(:description, :hours, :date)
    end

end
