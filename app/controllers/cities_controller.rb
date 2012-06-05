class CitiesController < ApplicationController
  respond_to :html, :json
  def index
    @cities = City.all
    respond_with(@cities) do |format|
      format.html
      format.json { render json: @cities }
    end
  end

  def new
    @city = City.new
    @city.ports.build
  end

  def create
    @city = City.new(params[:city])
    if @city.save
      flash[:notice] = "Ciudad agregada correctamente."
      redirect_to "index"
    else
      flash.now.alert = "Hubo un problema al agregar la ciudad, porfavor intente nuevamente."
      render "new"
    end
  end
  
  def show
    @city = City.find(params[:id])
  end
  
  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(params[:city])
      flash[:notice] = "Ciudad actualizada correctamente."
      redirect_to root_path
    else
      flash.now.alert = "Hubo un problema al actualizar la ciudad."
      render "edit"
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end
end
