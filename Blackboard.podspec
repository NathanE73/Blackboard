Pod::Spec.new do |s|
  s.name           = 'Blackboard'
  s.version        = '11.1.1'
  s.summary        = 'An iOS Storyboard and Asset Manager'
  s.homepage       = 'https://github.com/NathanE73/Blackboard'
  s.license        = { :type => 'MIT', :file => 'LICENSE' }
  s.author         = { 'Nathan E. Walczak' => 'knate@knate.com' }
  s.source         = { :http => "#{s.homepage}/releases/download/#{s.version}/portable-blackboard.zip" }
  s.preserve_paths = '*'
  s.exclude_files  = '**/file.zip'
end
