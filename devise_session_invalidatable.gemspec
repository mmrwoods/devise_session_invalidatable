Gem::Specification.new do |s|
  s.name = "devise_session_invalidatable"
  s.version = "0.1.0"
  s.summary = "Invalidate devise/warden sessions on logout"
  s.author = "Mark Woods"
  s.homepage = "https://github.com/thickpaddy/devise_session_invalidatable"
  s.files = `git ls-files`.split("\n")
  s.add_dependency('devise', '~> 1.1')
  s.requirements << 'session_invalidatable abuses the current sign in timestamp and ip created by trackable - you must include the trackable module in your models to use session_invalidatable'
end
