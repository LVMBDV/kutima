# frozen_string_literal: true

guard 'rspec', cmd: 'bundle exec rspec' do
  watch('spec/spec_helper.rb') { 'spec' }
  watch('config/routes.rb') { 'spec/routing' }
  watch('app/controllers/application_controller.rb') { 'spec/requests' }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/controllers/(.+)_controller\.rb$}) do |m|
    ["spec/routing/#{m[1]}_spec.rb", "spec/requests/#{m[1]}_controller_spec.rb"]
  end
  watch(%r{^app/models/(.+).rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }
  watch('config/routes.rb') { 'spec/routing' }
  watch(%r{^app/views/(.+)/(.+)\.html\.erb$}) { |m| "spec/views/#{m[1]}/#{m[2]}.html.erb_spec.rb" }
end
