require 'ostruct'

module Collectable
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def traits
      @traits ||= []
    end

    def trait(trait_name)
      traits.push(trait_name.to_s.downcase)
      traits.uniq!
    end

    def collected(sort_field = :name)
      traits.each_with_index.map {|name, index|
        OpenStruct.new(name: name, val: index)
      }.sort {|a,b| 
        a.send(sort_field) <=> b.send(sort_field)
      }
    end
  end
end
