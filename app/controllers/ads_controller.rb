class AdsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :view_by_category, :search]
  before_filter :get_ad, :only => [:show, :edit, :update, :destroy, :confirm_owner]
  before_filter :confirm_owner, :only => [:destroy, :edit]


  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad }
    end
  end

  # GET /ads/new
  # GET /ads/new.json
  def new
    @ad = Ad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad }
    end
  end

  # GET /ads/1/edit
  def edit

  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = current_user.ads.new(params[:ad])

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.'}
        format.json { render json: @ad, status: :created, location: @ad }
      else
        format.html { render action: "new" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  def view_by_category
    @ads = Ad.view_descendants(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ads }
    end
  end

  def search
    @ads = Ad.search(params[:search_query])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ads }
    end
  end

  private
  def get_ad
    @ad = Ad.find(params[:id])
  end
  
  def confirm_owner
     unless @ad.user_id == current_user.id
             flash[:notice] = "Sorry, you're not the owner of this ad."
             redirect_to :action => 'index'
     end
  end
end
