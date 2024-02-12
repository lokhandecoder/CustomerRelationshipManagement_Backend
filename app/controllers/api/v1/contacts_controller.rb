class Api::V1::ContactsController < ApplicationController
  before_action :set_api_v1_contact, only: %i[show update destroy]

  # GET /api/v1/contacts
  def index
    @api_v1_contacts = Contact.all
    render json: @api_v1_contacts
  end

  # GET /api/v1/contacts/1
  def show
    render json: @api_v1_contact
  end

  # POST /api/v1/contacts
  def create
    @api_v1_contact = Contact.new(api_v1_contact_params)

    if @api_v1_contact.save
      render json: @api_v1_contact, status: :created
    else
      render json: @api_v1_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/contacts/1
  def update
    if @api_v1_contact.update(api_v1_contact_params)
      render json: @api_v1_contact
    else
      render json: @api_v1_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/contacts/1
  def destroy
    @api_v1_contact.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_contact
      @api_v1_contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_contact_params
      params.require(:contact).permit(:name, :email, :phone, :position, :customer_id)
    end
end
