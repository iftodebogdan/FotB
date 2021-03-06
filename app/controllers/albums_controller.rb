class AlbumsController < ApplicationController

  before_filter do
    if !user_signed_in?
      redirect_to "/page/home"
    end
  end

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, :notice => 'Album was successfully created.' }
        format.json { render :json => @album, :status => :created, :location => @album }
      else
        format.html { redirect_to "/albums/new?band_id=#{@album.band_id}", :notice => @album.errors.full_messages }
        format.json { render :json => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to "/bands/#{@album.band_id}", :notice => 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to "/albums/#{@album.id}/edit?band_id=#{@album.band_id}", :notice => @album.errors.full_messages }
        format.json { render :json => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to "/bands/#{@album.band_id}" }
      format.json { head :no_content }
    end
  end
end
