module DeepState
  module Rails
    module Notifications
      def execute_transition event
        # Update the state machine with ActiveSupport notifications
        transition_details = {
          name: event.name,
          from: event.from,
          to: event.to,
          context: context
        }

        ActiveSupport::Notifications.instrument "deepstate.transition", transition_details do
          super event
        end
      end
    end
  end
end
