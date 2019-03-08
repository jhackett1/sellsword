class HoursController < ApplicationController
    before_action :set_project, only: [:create, :edit, :update, :destroy]
    before_action :set_hour, only: [:edit, :update, :destroy]

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
    def edit
    end


    # PATCH
    # Update existing hours
    def update

      puts @project.id
      puts @hour.id

      respond_to do |format|
        if @hour.update(hour_params)
          format.html { redirect_to @project, notice: 'Hours successfully amended.' }
          format.json { render :show, status: :ok, location: @hour }
        else
          format.html { redirect_to @project }
          format.json { render json: @hour.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE
    # Remove hours
    def destroy
      @hour.destroy
      respond_to do |format|
        format.html { redirect_to @project, notice: 'Hours successfully destroyed.' }
        format.json { head :no_content }
      end
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
