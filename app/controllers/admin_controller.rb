class AdminController < ApplicationController

  require 'fastercsv'
  
  TYPE_FILTER = Hash["city" => "city","state" => "state", "zipcode"=>"zipcode"]
  def getcsv
    entries = User.find(:all)
    csv_string = FasterCSV.generate do |csv| 
      csv << ["name","username","address","neighbourhood","city","state","zipcode","phone"]
      entries.each do |e|
        csv << [e.name,e.username,e.address,e.neighbourhood,e.city,e.state,e.zipcode,e.phone]
      end
    end
    send_data csv_string, :type => "text/plain", 
    :filename=>"entries.csv",
    :disposition => 'attachment'
  end

  def list_users
    @filter = TYPE_FILTER
    filter = case params[:sform]
      when "filter=name" then "name"
      when "filter=username" then "username"
      when "filter=city" then "city"
      
    end
    sort = case params[:sort]
      when "name"  then "name"
      when "username"  then "username"
      when "city" then "city"
      when "state"  then "state"
      when "phone" then "phone"
      when "neighbourhood"  then "neighbourhood"
      when "name_reverse"  then "name DESC"
      when "username_reverse"  then "username DESC"
      when "city_reverse"   then "city DESC"
      when "state_reverse" then "state DESC"
      when "neighbourhood_reverse"  then "neighbourhood DESC"
      when "phone_reverse"   then "phone DESC"
    end
    conditions = ["#{params[:user][:filter]}  like ?", "%#{params[:query]}%"] unless params[:query].nil?
    
    
    @users=User.paginate :page => params[:page], :per_page => 100, :order => sort, :conditions => conditions
    if request.xml_http_request?
      render :partial => "users_list", :layout => false
    end
    
  end
  
  def display_user
    @user=User.find(params[:id])
    
  end
  
  def list
    @filter = TYPE_FILTER
    filter = case params[:sform]
      when "filter=name" then "name"
      when "filter=username" then "username"
      when "filter=city" then "city"
    end
    
    sort = case params[:sort]
      when "name"  then "name"
      when "username"  then "username"
      when "city" then "city"
      when "state"  then "state"
      when "phone" then "phone"
      when "neighbourhood"  then "neighbourhood"
      when "name_reverse"  then "name DESC"
      when "username_reverse"  then "username DESC"
      when "city_reverse"   then "city DESC"
      when "state_reverse" then "state DESC"
      when "neighbourhood_reverse"  then "neighbourhood DESC"
      when "phone_reverse"   then "phone DESC"
    end
    conditions = [" #{params[:user][:filter]} like ?", "%#{params[:query]}%"] unless params[:query].nil?
    @total = User.count(:conditions => conditions)
    @users=User.paginate :page => params[:page], :per_page => 100, :order => sort, :conditions => conditions
    if request.xml_http_request?
      render :partial => "users_list", :layout => false
    end
    
  end
  
  
  def search
    @filter = TYPE_FILTER
    filter = case params[:sform]
      when "filter=name" then "name"
      when "filter=username" then "username"
      when "filter=city" then "city"
      
    end
    
    sort = case params[:sort]
      when "name"  then "name"
      when "username"  then "username"
      when "city" then "city"
      when "state"  then "state"
      when "phone" then "phone"
      when "neighbourhood"  then "neighbourhood"
      when "name_reverse"  then "name DESC"
      when "username_reverse"  then "username DESC"
      when "city_reverse"   then "city DESC"
      when "state_reverse" then "state DESC"
      when "neighbourhood_reverse"  then "neighbourhood DESC"
      when "phone_reverse"   then "phone DESC"
    end
    
    
    
    conditions = ["#{params[:user][:filter]}  like ?", "#{params[:query]}"] unless params[:query].nil?
    
    
    @users=User.paginate :page => params[:page], :per_page => 100, :order => sort, :conditions => conditions
    
    query = params[:q]
    p 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS'
    p query
    @search_results = Ultrasphinx::Search.new(:query => params[:q])
    @search_results.run
    @search_results.results
    p 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS'
    p @search_results
    
    
    # render :partial=>'search_results',:layout=>'application'
    if request.xml_http_request?
      render :partial => "users_list", :layout => false
    end
    
  end
  
  
end
