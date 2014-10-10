require 'ostruct'

module Collectable
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def value
      :value
    end

    def name
      :name
    end

    def characteristics
      @characteristics ||= []
    end

    def characteristic(characteristic_name)
      characteristics.push(characteristic_name.to_s.downcase)
      characteristics.uniq!
    end

    def collected(sort_field = :name)
      characteristics.each_with_index.map {|name, index|
        OpenStruct.new(name: name, value: index)
      }.sort {|a,b| 
        a.send(sort_field) <=> b.send(sort_field)
      }
    end
  end
end
