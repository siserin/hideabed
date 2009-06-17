ActionController::Routing::Routes.draw do |map|
  map.with_options(:format => 'json') do |json|
    json.with_options(:controller => 'databases') do |databases|
      databases.connect '/_all_dbs', :action => 'index',   :conditions => { :method => :get }
      databases.connect '/:name',    :action => 'create',  :conditions => { :method => :put }
      databases.connect '/:name',    :action => 'destroy', :conditions => { :method => :delete }
      databases.connect '/:name',    :action => 'show',    :conditions => { :method => :get }
    end

    json.with_options(:controller => 'designs') do |designs|
      designs.connect '/:database_name/_design/:name', :action => 'create', :conditions => { :method => :put }
    end
  end
end
