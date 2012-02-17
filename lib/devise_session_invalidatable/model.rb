require 'devise_session_invalidatable/hooks'

module Devise
  module Models
    module SessionInvalidatable

      def invalidate_session!
        self.current_sign_in_at = nil
        self.current_sign_in_ip = nil
        save(:validate => false)
      end

      def session_invalidated?
        current_sign_in_ip.nil? || current_sign_in_at.nil?
      end

    end
  end
end
