Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'sets_uuid'
  s.version           = '1.0.0'
  s.date              = '2010-07-27'
  s.rubyforge_project = 'sets_uuid'

  s.summary = %q{UUID management for models}
  s.description = %q{Adds declarative uuid attribute initialization to models}

  s.authors  = ["Emmanuel Oga"]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/emmanueloga'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.rdoc LICENSE]

  s.add_dependency('simple_uuid', [">= 0.1.1"])
  s.add_dependency('activerecord', [">= 2.0.0"])

  s.add_development_dependency('rspec', [">= 1.1.0", "< 2.0.0"])

  # = MANIFEST =
  s.files = %w[
    CHANGELOG
    LICENSE
    README.rdoc
    Rakefile
    lib/sets_uuid.rb
    sets_uuid.gemspec
    spec/sets_uuid_spec.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^spec\// }
end
