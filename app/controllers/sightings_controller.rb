class SightingsController < ApplicationController
  def new
    animal = Animal.find(params[:animal_id])
    @sightings = animal.sightings.new
  end

  def create
    @sightings = Sighting.new(sighting_params)
    if @sightings.save
      redirect_to animal_path(@sightings.animal)
    else
      @errors = @sightings.errors.full_messages
      render :new
    end
  end

  def edit
    @sightings = Sighting.find(params[:id])
  end

  def update
    @sightings = Sighting.find(params[:id])
    if @sightings.update(sighting_params)
      redirect_to animal_path(@sightings.animal)
    else
      @errors = @sightings.errors.full_messages
      render :new
    end
  end

  def destroy
    @sightings = Sighting.destroy(params[:id])
    redirect_to animal_path(@sightings.animal)
  end

  private
  def sighting_params
    params.require(:sighting).permit(:animal_id, :date, :time, :latitude, :longitude)
  end
end
