module DynamicActionable
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def make_list_actions_by(list, klass)
      fail('Não é um EnumerateIt::Base') unless list < EnumerateIt::Base

      list.keys.each do |method_name|
        define_method method_name do
          instance_name = "@#{klass.name.underscore.pluralize}"

          instance_variable_set(instance_name, write_query(klass, method_name))
          respond_with :api, :v1, instance_variable_get(instance_name)
        end
      end
    end

    private

    def write_query(klass, method_name)
      klass.send(method_name).send(:page, params[:page])
    end
  end
end
