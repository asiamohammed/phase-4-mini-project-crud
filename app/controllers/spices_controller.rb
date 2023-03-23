class SpicesController < ApplicationController
  def index
    spices = Spice.all 
    render json: spices
  end

  def show
    spice = spice_find
    if spice
      render json: spice
    else
      spice_not_found
    end
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = spice_find
    if spice
      spice.update(spice_params)
      render json: spice
    else
      spice_not_found
    end

  end

  def destroy
    spice = spice_find
    if spice
      spice.destroy
      head :no_content
    else
       spice_not_found
    end
  end

  private 

  def spice_not_found
     render json: {error: "Spice not found"}, status: :not_found
  end

  def spice_find
       Spice.find_by(id: params[:id])
  end


  def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
  end
end
