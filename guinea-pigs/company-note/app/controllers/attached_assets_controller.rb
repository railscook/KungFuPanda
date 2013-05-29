class AttachedAssetsController < ApplicationController
  # GET /attached_assets
  # GET /attached_assets.json
  def index
    @attached_assets = AttachedAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attached_assets }
    end
  end

  # GET /attached_assets/1
  # GET /attached_assets/1.json
  def show
    @attached_asset = AttachedAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attached_asset }
    end
  end

  # GET /attached_assets/new
  # GET /attached_assets/new.json
  def new
    @attached_asset = AttachedAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attached_asset }
    end
  end

  # GET /attached_assets/1/edit
  def edit
    @attached_asset = AttachedAsset.find(params[:id])
  end

  # POST /attached_assets
  # POST /attached_assets.json
  def create
    @attached_asset = AttachedAsset.new(params[:attached_asset])

    respond_to do |format|
      if @attached_asset.save
        format.html { redirect_to @attached_asset, notice: 'Attached asset was successfully created.' }
        format.json { render json: @attached_asset, status: :created, location: @attached_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @attached_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attached_assets/1
  # PUT /attached_assets/1.json
  def update
    @attached_asset = AttachedAsset.find(params[:id])

    respond_to do |format|
      if @attached_asset.update_attributes(params[:attached_asset])
        format.html { redirect_to @attached_asset, notice: 'Attached asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attached_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attached_assets/1
  # DELETE /attached_assets/1.json
  def destroy
    @attached_asset = AttachedAsset.find(params[:id])
    @attached_asset.destroy

    respond_to do |format|
      format.html { redirect_to attached_assets_url }
      format.json { head :no_content }
    end
  end
end
