module DynamicActionable
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    # rubocop:disable Metrics/AbcSize
    def make_list_actions_by(list, klass)
      fail('Não é um enum') unless list < EnumerateIt::Base

      list.keys.each do |method_name|
        define_method method_name do
          query = klass.send(method_name).page(params[:page])
          instance_name = "@#{klass.name.underscore.pluralize}"

          instance_variable_set(instance_name, query)
          respond_with :api, :v1, instance_variable_get(instance_name)
        end
      end
    end

    def make_post_actions_by(list, klass)
      fail('Não é um enum') unless list < EnumerateIt::Base

      list.keys.each do |method_name|
        define_method method_name do
          instance_name = "@#{klass.name.underscore}"
          instance = instance_variable_get instance_name

          instance.send("#{method_name}!")
          instance.save!

          respond_with :api, :v1, instance
        end
      end
    end
  end
end
