class DirectionsController < ApplicationController
  # GET /directions
  # GET /directions.xml
  def index
    @directions = Direction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @directions }
    end
  end

  # GET /directions/1
  # GET /directions/1.xml
  def show
    @direction = Direction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @direction }
    end
  end

  # GET /directions/new
  # GET /directions/new.xml
  def new
    @direction = Direction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @direction }
    end
  end

  # GET /directions/1/edit
  def edit
    @direction = Direction.find(params[:id])
  end

  # POST /directions
  # POST /directions.xml
  def create
    @direction = Direction.new(params[:direction])

    respond_to do |format|
      if @direction.save
        format.html { redirect_to(@direction, :notice => 'Direction was successfully created.') }
        format.xml  { render :xml => @direction, :status => :created, :location => @direction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @direction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /directions/1
  # PUT /directions/1.xml
  def update
    @direction = Direction.find(params[:id])

    respond_to do |format|
      if @direction.update_attributes(params[:direction])
        format.html { redirect_to(@direction, :notice => 'Direction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @direction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.xml
  def destroy
    @direction = Direction.find(params[:id])
    @direction.destroy

    respond_to do |format|
      format.html { redirect_to(directions_url) }
      format.xml  { head :ok }
    end
  end
end
