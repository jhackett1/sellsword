class HoursController < ApplicationController
    before_action :set_project, only: [:create, :edit, :update, :destroy]
    before_action :set_hour, only: [:edit, :update, :destroy]

    def create
      @hour = @project.hours.new(hour_params)
      if @hour.save
        redirect_to @project, notice: 'Hour was successfully created.'
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
        redirect_to @project
      end
    end

    def destroy
      @hour.destroy
      redirect_to @project, notice: 'Hours successfully destroyed.'
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_hour
      @hour = @project.hours.find(params[:id])
    end

    def hour_params
        params.require(:hour).permit(:description, :hours, :date, :project_id)
    end

end
