class NamesController < ApplicationController
  # GET /names
  # GET /names.xml
  
  def index
  
   @names = Name.all
  
    #loop through all the attributes of each object and replace code_id with description
    @names.each do |n| 
    
      if not n.geographical_region.empty?
        temp = Regioncode.find_by_code n.geographical_region
        n.geographical_region = temp.description
      end
      
      # get the department code for this person: 
     if not n.department.empty?
      temp = Regioncode.find_by_code n.department
      n.department = temp.description
    end
    
    # get the municipality code for this person: 
    if not n.municipality.empty?
      temp = Regioncode.find_by_code n.municipality
      n.municipality = temp.description
    end

    # get the administrative_district code for this person: 
    if not n.admin_district.empty?
      temp = Regioncode.find_by_code n.admin_district
      n.admin_district = temp.description
    end
    
     # get the communes code for this person: 
    if not n.commune.empty?
      temp = Regioncode.find_by_code n.commune
      n.commune = temp.description
    end
    
  end


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @names }
    end
  
end

  # GET /names/1
  # GET /names/1.xml
  def show
        
    # grab all the parameters/attributes for this person
    @name = Name.find(params[:id])
    
   # get the geographical_region code for this person, if he/she has no code do nothing: 
    if not @name.geographical_region.empty?
      temp = Regioncode.find_by_code @name.geographical_region
      @name.geographical_region = temp.description
    end
    
   # get the department code for this person: 
    if not @name.department.empty?
      temp = Regioncode.find_by_code @name.department
      @name.department = temp.description
    end
    
    # get the municipality code for this person: 
    if not @name.municipality.empty?
      temp = Regioncode.find_by_code @name.municipality
      @name.municipality = temp.description
    end

    # get the administrative_district code for this person: 
    if not @name.admin_district.empty?
      temp = Regioncode.find_by_code @name.admin_district
      @name.admin_district = temp.description
    end
    
     # get the communes code for this person: 
    if not @name.commune.empty?
      temp = Regioncode.find_by_code @name.commune
      @name.commune = temp.description
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @name }
    end
    
  end
  
  

  # GET /names/new
  # GET /names/new.xml
  def new
    
    @name = Name.new
    
    @regions = Regioncode.geographical_region()
    @department = []
    @municipality = []
    @admin_district = []
    @commune = []


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @name }
    end
  end

  # GET /names/1/edit
  def edit
    @name = Name.find(params[:id])
    
    @regions = Regioncode.geographical_region(@name.geographical_region.to_s)
    @department = Regioncode.department(@name.department.to_s)
    @municipality = Regioncode.municipality(@name.municipality.to_s)
    @admin_district = Regioncode.administrative_district(@name.admin_district.to_s)
    @commune = Regioncode.commune(@name.commune.to_s) 
    
    
  end

  # POST /names
  # POST /names.xml
  def create
    @name = Name.new(params[:name])

    respond_to do |format|
      if @name.save
        flash[:notice] = 'Name was successfully created.'
        format.html { redirect_to(@name) }
        format.xml  { render :xml => @name, :status => :created, :location => @name }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /names/1
  # PUT /names/1.xml
  def update
    @name = Name.find(params[:id])

    respond_to do |format|
      if @name.update_attributes(params[:name])
        flash[:notice] = 'Name was successfully updated.'
        format.html { redirect_to(@name) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.xml
  def destroy
    @name = Name.find(params[:id])
    @name.destroy

    respond_to do |format|
      format.html { redirect_to(names_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def update_department
    
     @department = Regioncode.department(params[:geographical_region])   # you get department from region
     @municipality = []
     @admin_district = []
     @commune = []
    
    render :update do |page|
      page.replace_html 'department', :partial => 'department', :object => @department
      page.replace_html 'municipality', :partial => 'municipality', :object => @municipality
      page.replace_html 'admin_district', :partial => 'admin_district', :object => @admin_district
      page.replace_html 'commune', :partial => 'commune', :object => @commune
    end
  
  end
  

 def update_municipality
   
   @municipality = Regioncode.municipality(params[:department])
    @admin_district = []
    @commune = []
    
    render :update do |page|
     page.replace_html 'municipality', :partial => 'municipality', :object => @municipality
     page.replace_html 'admin_district', :partial => 'admin_district', :object => @admin_district
     page.replace_html 'commune', :partial => 'commune', :object => @commune
  end

end


  def update_admin_district
    
     @admin_district= Regioncode.administrative_district(params[:municipality])
     @commune = []
    
    render :update do |page|
     page.replace_html 'admin_district', :partial => 'admin_district', :object => @admin_district
     page.replace_html 'commune', :partial => 'commune', :object => @commune
   end

end
 
   
  def update_commune
    
    @commune = Regioncode.commune(params[:admin_district] )  # you get commune from admin_district
     
    render :update do |page|
      page.replace_html 'commune', :partial => 'commune', :object => @commune
    end
  end

end
