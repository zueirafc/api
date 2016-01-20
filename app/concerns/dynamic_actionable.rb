module DynamicActionable
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def make_list_actions_by(list, klass)
      fail('Não é um enum') unless list < EnumerateIt::Base

      list.keys.each do |method_name|
        define_method method_name do
          query = klass.send(method_name)
          instance_name = "@#{klass.name.underscore.pluralize}"

          instance_variable_set(instance_name, query)
          respond_with :api, :v1, instance_variable_get(instance_name)
        end
      end
    end
  end
end
