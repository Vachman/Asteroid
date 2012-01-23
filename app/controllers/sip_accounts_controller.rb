class SipAccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def toggle_lock
    puts "Toggle lock"
  end
  
  def toggle_on_off
    logger.debug "\e[1;31m #{params[:id]} ON/OFF \e[0m"
    @sip_account = SipAccount.find(params[:id])
    @sip_account.turn_on? ? @sip_account.turn_off : @sip_account.turn_on 
    redirect_to :back;
  end

  # GET /sip_accounts
  # GET /sip_accounts.xml
  def index
    @sip_accounts = SipAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sip_accounts }
    end
  end

  # GET /sip_accounts/1
  # GET /sip_accounts/1.xml
  def show
    @sip_account = SipAccount.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @sip_account }
    end
  end

  # GET /sip_accounts/new
  # GET /sip_accounts/new.xml
  def new
    @sip_account = SipAccount.new
    @sip_account.allow = "alaw;g729"
    @companies = Company.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sip_account }
      format.js
    end
  end

  # GET /sip_accounts/1/edit
  def edit
    @sip_account = SipAccount.find(params[:id])
    @companies = Company.all
  end

  # POST /sip_accounts
  # POST /sip_accounts.xml
  def create
    @sip_account = SipAccount.new(params[:sip_account])
    
    @sip_account.username = @sip_account.name 
    @sip_account.regexten = @sip_account.name 
    
    
    respond_to do |format|
      if @sip_account.save
        format.html { redirect_to(sip_accounts_path, :notice => 'Sip account was successfully created.') }
        format.xml  { render :xml => @sip_account, :status => :created, :location => @sip_account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sip_account.errors, :status => :unprocessable_entity }
      end
      
    end
  end

  # PUT /sip_accounts/1
  # PUT /sip_accounts/1.xml
  def update
    @sip_account = SipAccount.find(params[:id])

    respond_to do |format|
      if @sip_account.update_attributes(params[:sip_account])
        format.html { redirect_to(sip_accounts_path, :notice => 'Sip account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sip_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sip_accounts/1
  # DELETE /sip_accounts/1.xml
  def destroy
    @sip_account = SipAccount.find(params[:id])
    @sip_account.destroy

    respond_to do |format|
      format.html { redirect_to(sip_accounts_url) }
      format.xml  { head :ok }
    end
  end
end
