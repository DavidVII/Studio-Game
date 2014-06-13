Gem::Specification.new do |s|
  s.name         = "treasure_hunter"
  s.version      = "1.0.0"
  s.author       = "David Becerra"
  s.email        = "DavidBecerra84@gmail.com"
  s.homepage     = "http://DavidBecerra.com"
  s.summary      = "Used to learn some Ruby concepts"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'treasure_hunter' ]

  s.required_ruby_version = '>=2.1'
  s.add_development_dependency 'rspec', '~> 3.0'
end

