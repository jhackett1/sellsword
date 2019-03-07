class HoursController < ApplicationController
    before_action :set_project, only: [:create, :edit]
    # before_action :set_hour, only: [:edit]

    # GET
    # Show all hours under particular project
    # def index
    # end

    # POST
    # Create new hours
    def create
        @hour = @project.hours.new(hour_params)
        respond_to do |format|
          if @hour.save
            format.html { redirect_to @project, notice: 'Hour was successfully created.' }
            format.json { render :show, status: :created, location: @hour }
          else
            format.html { redirect_to @project, notice: 'There was a problem.' }
            format.json { render json: @hour.errors, status: :unprocessable_entity }
          end
        end
    end

    # GET
    # Update existing hours
    # def edit
    # end


    # PATCH
    # Update existing hours
    # def update
    # end

    # DELETE
    # Remove hours
    # def destroy
    # end


    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    # def set_hour
    #   @hour = @project.hours.find(params[:id])
    # end

    def hour_params
        params.require(:hour).permit(:description, :hours, :date, :project_id)
    end

end
