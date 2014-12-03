Pod::Spec.new do |s|
  s.name     = 'PulsingLayer'
  s.version  = '1.0.0'
  s.license  = { :type => 'MIT' }
  s.homepage = 'https://github.com/kimar/pulsinglayer'
  s.authors  = { 'Marcus Kida' => 'marcus@kida.io' }
  s.summary  = 'Adds a customizable CALayer halo effect to any arbitrary UIView. Completely written in Swift.'
  s.source   = { :git => 'https://github.com/kimar/pulsinglayer', :tag => "#{s.version}" }
  s.source_files = '*.{h,swift}'
  s.frameworks = 'Swift'
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
end
