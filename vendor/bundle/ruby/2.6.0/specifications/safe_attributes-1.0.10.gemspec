# -*- encoding: utf-8 -*-
# stub: safe_attributes 1.0.10 ruby lib

Gem::Specification.new do |s|
  s.name = "safe_attributes".freeze
  s.version = "1.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.10".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian Jones".freeze]
  s.date = "2013-03-07"
  s.description = "Better support for legacy database schemas for ActiveRecord, such as columns named class, or any other name that conflicts with an instance method of ActiveRecord.".freeze
  s.email = "cbjones1@gmail.com".freeze
  s.homepage = "http://github.com/bjones/safe_attributes".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Useful for legacy database support, adds support for reserved word column names with ActiveRecord".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.3.0"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.3.0"])
  end
end
