class Api::V1::CustomersController < ApplicationController
  before_action :set_api_v1_customer, only: %i[show update destroy]

  # GET /api/v1/customers
  def index
    @api_v1_customers = Customer.all
    render json: @api_v1_customers
  end

  # GET /api/v1/customers/1
  def show
    render json: @api_v1_customer
  end

  # POST /api/v1/customers
  def create
    @api_v1_customer = Customer.new(api_v1_customer_params)

    if @api_v1_customer.save
      render json: @api_v1_customer, status: :created
    else
      render json: @api_v1_customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/customers/1
  def update
    if @api_v1_customer.update(api_v1_customer_params)
      render json: @api_v1_customer
    else
      render json: @api_v1_customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/customers/1
  def destroy
    @api_v1_customer.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_customer
      @api_v1_customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_customer_params
      params.require(:customer).permit(:name, :email, :phone)
    end
end
