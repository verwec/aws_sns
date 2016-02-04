Gem::Specification.new do |s|
  s.name        = 'sns_gateway'
  s.version     = '0.0.2'
  s.date        = '2016-02-01'
  s.summary     = "Simple gateway to send push notifications via amazon sns"
  s.description = "Simple gateway to send push notifications via amazon sns"
  s.authors     = ["verwec"]
  s.files       = ["lib/sns_gateway.rb"]
  s.add_dependency "aws-sdk-core"
  s.add_development_dependency "rspec"
end
