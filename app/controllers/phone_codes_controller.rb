class PhoneCodesController < ApplicationController
  # GET /phone_codes
  # GET /phone_codes.xml
  def index
    @phone_codes = PhoneCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @phone_codes }
    end
  end

  # GET /phone_codes/1
  # GET /phone_codes/1.xml
  def show
    @phone_code = PhoneCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @phone_code }
    end
  end

  # GET /phone_codes/new
  # GET /phone_codes/new.xml
  def new
    @phone_code = PhoneCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @phone_code }
    end
  end

  # GET /phone_codes/1/edit
  def edit
    @phone_code = PhoneCode.find(params[:id])
  end

  # POST /phone_codes
  # POST /phone_codes.xml
  def create
    @phone_code = PhoneCode.new(params[:phone_code])

    respond_to do |format|
      if @phone_code.save
        format.html { redirect_to(@phone_code, :notice => 'Phone code was successfully created.') }
        format.xml  { render :xml => @phone_code, :status => :created, :location => @phone_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @phone_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phone_codes/1
  # PUT /phone_codes/1.xml
  def update
    @phone_code = PhoneCode.find(params[:id])

    respond_to do |format|
      if @phone_code.update_attributes(params[:phone_code])
        format.html { redirect_to(@phone_code, :notice => 'Phone code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @phone_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_codes/1
  # DELETE /phone_codes/1.xml
  def destroy
    @phone_code = PhoneCode.find(params[:id])
    @phone_code.destroy

    respond_to do |format|
      format.html { redirect_to(phone_codes_url) }
      format.xml  { head :ok }
    end
  end
end
