# frozen_string_literal: true

# Generator for React Rails authentication setup
class ReactRailsAuthGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  def create_controller_files
    template "authentication_concern.rb.tt", "app/controllers/concerns/authentication.rb"
    template "application_controller.rb.tt", "app/controllers/application_controller.rb"
    template "passwords_controller.rb.tt", "app/controllers/v1/passwords_controller.rb"
    template "registrations_controller.rb.tt", "app/controllers/v1/registrations_controller.rb"
    template "sessions_controller.rb.tt", "app/controllers/v1/sessions_controller.rb"
  end

  def create_mailer_files
    template "passwords_mailer.rb.tt", "app/mailers/passwords_mailer.rb"
  end

  def create_model_files
    template "current.rb.tt", "app/models/current.rb"
    template "session.rb.tt", "app/models/session.rb"
    template "user.rb.tt", "app/models/user.rb"
  end

  def create_config_files
    template "routes.rb.tt", "config/routes.rb"
  end

  def create_migration_files
    template "create_users.rb.tt", "db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_users.rb"
    sleep 1
    template "create_sessions.rb.tt", "db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_sessions.rb"
  end

  def create_frontend_files
    template "LoginForm.tsx.tt", "frontend/src/components/LoginForm.tsx"
    template "SignupForm.tsx.tt", "frontend/src/components/SignupForm.tsx"
    template "useAuthStore.ts.tt", "frontend/src/hooks/useAuthStore.ts"
    template "auth_schema.ts.tt", "frontend/src/schemas/auth.ts"
    template "auth_service.ts.tt", "frontend/src/services/auth.ts"
    template "auth_types_index.ts.tt", "frontend/src/types/api/auth/index.ts"
    template "assertions.ts.tt", "frontend/src/utils/assertions.ts"
    template "App.tsx.tt", "frontend/src/App.tsx"
    template "index.ts.tt", "frontend/src/index.ts"
    template "package.json.tt", "frontend/package.json"
  end

  def add_gem_dependency
    gem "rack-cors"
  end

  def create_cors_initializer
    template "cors.rb.tt", "config/initializers/cors.rb"
  end
end
