class InvoicesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project

    def pdf
        render pdf: "invoice"
    end

    def new
        @invoice = @project.invoices.new
        @invoice.charges.new
    end

    def create
        @invoice = @project.invoices.build(invoice_params)
        if @invoice.save
          redirect_to @project, notice: 'Invoice successfully created.'
        else
          redirect_to @project, notice: 'There was a problem.'
        end
    end

    def show
        @invoice = @project.invoices.find(params[:id])
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def invoice_params
        params.require(:invoice).permit(:discount, charges_attributes: [:description, :notes, :rate, :hours])
    end

end