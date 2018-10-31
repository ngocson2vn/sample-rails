class AuthorizedServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @authorized_services = AuthorizedService.where("id > 1")
    render json: { authorized_services: @authorized_services }, status: 200
  end

  def create
    begin
      params[:authorized_services].each do |service|
        authorized_service = AuthorizedService.new
        authorized_service.application_name = service[:application_name]
        authorized_service.old_application_token = service[:application_token]
        authorized_service.valid_until = Time.now.utc + 3600
        authorized_service.application_token = service[:application_token]
        authorized_service.save
      end

      render json: {message: :ok, status: 200}, status: 200
    rescue => ex
      render json: {message: "#{ex.message}", status: 500}, status: 500
    end
  end

  def update
    begin
      authorized_service = AuthorizedService.find_or_initialize_by(application_name: application_name)

      if authorized_service.application_token
        authorized_service.old_application_token = authorized_service.application_token
      else
        authorized_service.old_application_token = application_token
      end

      authorized_service.valid_until = Time.now.utc + 3600
      authorized_service.application_token = application_token
      authorized_service.save

      render json: {message: :ok, status: 200}, status: 200
    rescue => ex
      render json: {message: "#{ex.message}", status: 500}, status: 500
    end
  end

  def destroy
    begin
      msg = 'ok'
      params[:authorized_services].each do |service|
        authorized_service = AuthorizedService.find_by(application_name: service)
        if authorized_service.id > 1
          authorized_service.destroy
        else
          msg = "Not allowed to remove the service '#{service}'"
        end
      end

      render json: {message: msg, status: 200}, status: 200
    rescue => ex
      render json: {message: "#{ex.message}", status: 500}, status: 500
    end
  end

  private
    def application_name
      params[:authorized_service][:application_name]
    end

    def application_token
      params[:authorized_service][:application_token]
    end
end
