class AppearancesController < ApplicationController
  def new
    @appearance = Appearance.new
    @guests = Guest.all
    @episodes = Episode.all
    @ratings_array = (1..5).to_a.map { |i| [i,i] }
  end

  def create
    appearance = Appearance.new(appearance_params)
    if appearance.save
      #redirect to actor page?
      flash[:success] = "Appearance successfully created!"
      guest = appearance.guest
      redirect_to guest_path(guest)
    else
      #error and render new
      flash[:danger] = "Unable to create appearance."
      @appearance = Appearance.new
      @guests = Guest.all
      @episodes = Episode.all
      @ratings_array = (1..10).to_a
      render 'new'
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id)
  end
end
