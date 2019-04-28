module DeepState
  module Rails
    extend ActiveSupport::Concern

    class_methods do
      def use_deep_state_machine machine_class, options={}
        column = options.fetch :column, 'state'
        as = options.fetch :as, 'machine'
        with = options.fetch :with, {}

        # use_deep_state_machine LifeOfACat, column: :state, as: :life, with: {}
        # life
        define_method as do
          return instance_variable_get("@#{as}") if instance_variable_get("@#{as}").present?

          context = with.merge({ as => self })
          machine = machine_class.new send(column), context
          instance_variable_set "@#{as}", machine
        end

        define_method "set_initial_state" do
          send("#{column}=", send(as).current_state)
        end

        # restore_life
        define_method "restore_#{as}" do
          state = send(column)
          send(as).restore!(state.to_sym) if state.present?
        end

        # update_life_state
        define_method "update_#{as}_state" do
          write_attribute column, send(as).current_state
        end

        module_eval do
          before_validation :set_initial_state, on: :create
          after_find "restore_#{as}".to_sym
          after_initialize "restore_#{as}".to_sym
          before_validation "update_#{as}_state".to_sym, on: :update
          scope :in_state, ->(state){ where(column => machine_class.new.search_state_filter(state)) }
        end
      end
    end
  end
end
