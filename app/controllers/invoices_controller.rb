class InvoicesController < ApplicationController
    before_action :set_project

    def new
        @invoice = @project.invoices.new
        1.times { @invoice.charges.new }
    end

    def create

        puts invoice_params

        @invoice = @project.invoices.build(invoice_params)
        if @invoice.save
          redirect_to @project, notice: 'Invoice successfully created.'
        else
          redirect_to @project, notice: 'There was a problem.'
        end
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def invoice_params
        params.require(:invoice).permit(:discount, charges_attributes: [:description, :notes, :rate, :hours])
    end

end