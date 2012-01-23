class ContextRulesController < ApplicationController
  # GET /context_rules
  # GET /context_rules.xml
  def index
    @context_rules = ContextRule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @context_rules }
    end
  end

  # GET /context_rules/1
  # GET /context_rules/1.xml
  def show
    @context_rule = ContextRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @context_rule }
    end
  end

  # GET /context_rules/new
  # GET /context_rules/new.xml
  def new
    @context_rule = ContextRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @context_rule }
    end
  end

  # GET /context_rules/1/edit
  def edit
    @context_rule = ContextRule.find(params[:id])
  end

  # POST /context_rules
  # POST /context_rules.xml
  def create
    @context = Context.find(params[:context_id])
    @context_rule = @context.context_rules.create(params[:context_rule])
    redirect_to context_path(@context)
  end

  # PUT /context_rules/1
  # PUT /context_rules/1.xml
  def update
    @context_rule = ContextRule.find(params[:id])

    respond_to do |format|
      if @context_rule.update_attributes(params[:context_rule])
        format.html { redirect_to(@context_rule, :notice => 'Context rule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @context_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /context_rules/1
  # DELETE /context_rules/1.xml
  def destroy
    @context = Context.find(params[:context_id])
    @context_rule = @context.context_rules.find(params[:id])
    @context_rule.destroy
    redirect_to context_path(@context)
  end
end
