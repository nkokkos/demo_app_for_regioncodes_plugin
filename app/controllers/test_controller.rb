class TestController < ApplicationController

  def index
     
     @region = Regioncode.geographical_region() # call it without parameters to get all regions
     @department = []
     @municipality = []
     @admin_district = []
     @commune = []
    
  end

  def update_department
    
   #  @region =  Regioncode.geographical_region(params[:region]) 
     @department = Regioncode.department(params[:region])   # you get department from region
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
     
     @municipality = Regioncode.municipality(params[:department]) # you get municipality from department
     @admin_district = []
     @commune = []
     
    render :update do |page|
      page.replace_html 'municipality', :partial => 'municipality', :object => @municipality
      page.replace_html 'admin_district', :partial => 'admin_district', :object => @admin_district
      page.replace_html 'commune', :partial => 'commune', :object => @commune
    end
  end


  def update_admin_district
    
     @admin_district = Regioncode.administrative_district(params[:municipality]) # you get admin_district from municipality
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
