class Notification
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    store_in collection: "notifications", database:"db", client:"default"
    

    def set_property(name, value)
      prop_name = "@#{name}".to_sym # you need the property name, prefixed with a '@', as a symbol
      self.instance_variable_set(prop_name, value)
    end
end
