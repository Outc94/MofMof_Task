class PropertiesController < ApplicationController
  before_action :set_property, only: [:edit, :update, :destroy, :show]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end

  def edit
    1.times { @property.stations.build }
  end

  def create
    @property = Property.new(property_params)

      if @property.save
       redirect_to @property, notice: 'Property was successfully created.'
      else
      render :new
      end
  end

  def update
      if @property.update(property_params)
        redirect_to @property, notice: 'Property was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @property.destroy
      redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private

    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:property, :rent, :address, :building_age, :remarks, stations_attributes: [ :id,
                                                                                                                  :railway_line,
                                                                                                                  :station_name,
                                                                                                                  :minutes_walk ])
    end
end
