class Info
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic  
    store_in collection:"user_info",database:"archivi",client:"default"                        
end