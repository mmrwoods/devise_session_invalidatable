# Invalidate the session on logout (i.e. clear the current sign in timestamp and ip)
Warden::Manager.before_logout do |record, warden, options|
  if warden.authenticated?(options[:scope])
    record.invalidate_session!
  end
end

# Check for a valid session when fetching the record from the session
Warden::Manager.after_set_user :only => :fetch do |record, warden, options|
  scope = options[:scope]
  if warden.authenticated?(scope) && record.invalidated?
    path_checker = Devise::PathChecker.new(warden.env, scope)
    unless path_checker.signing_out?
      throw :warden, :scope => scope, :message => "Session no longer valid. Please sign in."
    end
  end
end
