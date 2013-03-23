class FavouritesController < ApplicationController
  # GET /favourites
  # GET /favourites.json
  def index
    if current_user
    @favourites = Favourite.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favourites }
    end
  else
    redirect_to ads_url, :notice => "Please log in to continue"
  end
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show
    if current_user
    @favourite = Favourite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favourite }
    end
  else
    redirect_to ads_url, :notice => "Please log in to continue"
  end
  end

  # GET /favourites/new
  # GET /favourites/new.json
  def new
    @favourite = Favourite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favourite }
    end
  end

  # POST /favourites
  # POST /favourites.json
  def create
    @favourite = Favourite.find_or_create_by_ad_id_and_user_id(:ad_id => params[:ad_id], :user_id => current_user.id)
    
      respond_to do |format|
        if @favourite.save
          format.html { redirect_to @favourite, notice: 'Added to favourites' }
          format.json { render json: @favourite, status: :created, location: @favourite }
        end
      end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy

    respond_to do |format|
      format.html { redirect_to favourites_url }
      format.json { head :no_content }
    end
  end

end
