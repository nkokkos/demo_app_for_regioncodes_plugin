class TestController < ApplicationController

  def index

    @nomos  =  Regioncode.nomos("") # need to pass an empty string to return all regions
    @dhmotiko_diamerisma = []
    @dhmos = []

  end

  def update_dhmotiko_diamerisma
    
    @nomos  =  Regioncode.nomos(params[:code])
    @dhmotiko_diamerisma = Regioncode.dhmotiko_diamerisma(params[:code])
    @dhmos = []

    render :update do |page|
      page.replace_html 'dhmotiko_diamerisma', :partial => 'dhmotiko_diamerisma', :object => @dhmotiko_diamerisma
      page.replace_html 'dhmos', :partial => 'dhmos', :object => @dhmos
    end
  
  end

  def update_dhmos

   @dhmos = Regioncode.dhmos_or_oikismos(params[:code])

    render :update do |page|
      page.replace_html 'dhmos', :partial => 'dhmos', :object => @dhmos
    end
  end

end
