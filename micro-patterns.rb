module Patterns
  class Flag
    attr_accessor :set, :unset, :is_set, :is_unset
    attr_reader :name, :instance_variable_name
    
    def initialize(name)
      @name = name
      @instance_variable_name = "@#{self.name}_#{rand(1000)}"
    end

  end
  
  def flag(name, &configurator)
    local_flag = Flag.new(name)
    
    instance_variable_set(local_flag.instance_variable_name, false)
    
    yield local_flag
    
    define_method(local_flag.set) do
      instance_variable_set(local_flag.instance_variable_name, true)
    end
    
    define_method(local_flag.unset) do
      instance_variable_set(local_flag.instance_variable_name, false)
    end
    
    define_method(local_flag.is_set) do
      return instance_variable_get(local_flag.instance_variable_name)
    end
    
    define_method(local_flag.is_unset) do
      return ! instance_variable_get(local_flag.instance_variable_name)
    end
  end
  
end




