# A sample Guardfile
# More info at https://github.com/guard/guard#readme
require 'active_support/inflector'

guard 'spork' do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

guard 'rspec', all_after_pass: false, :cli => "--drb" do
  watch(%r{^spec/}) { "spec" }
  watch(%r{^app/}) { "spec" }
  watch('config/routes.rb') { "spec" }

  # # Custom Rails Tutorial specs
  # watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    # [ "spec/routing/#{m[1]}_routing_spec.rb",
      # "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      # "spec/acceptance/#{m[1]}_spec.rb",
      # (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" :
                       # "spec/requests/#{m[1].singularize}_pages_spec.rb")
    # ]
  # end
  # watch(%r{^app/views/(.+)/}) do |m|
    # (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" :
                      # "spec/requests/#{m[1].singularize}_pages_spec.rb")
  # end
  # watch(%r{^app/controllers/sessions_controller\.rb$}) do |m|
    # "spec/requests/authentication_pages_spec.rb"
  # end

  # # Rails example
  # watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  # watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  # watch('config/routes.rb')                           { "spec/routing" }
  # watch('app/controllers/application_controller.rb')  { "spec/controllers" }

end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end
