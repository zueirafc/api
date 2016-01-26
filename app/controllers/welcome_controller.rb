class WelcomeController < ApplicationController
  skip_before_filter :restrict_access
  before_action :make_a_hash

  def index
    respond_with @welcome
  end

  private

  # rubocop:disable Metrics/MethodLength
  def make_a_hash
    # Rails.application.routes.routes
    @welcome =
      {
        name: 'ZueiraFCAPI',
        for: 'Zueira Futebol Clube',
        current_version: {
          version: 'v1',
          codename: 'Galatasaray',
          status: 'development'
        },
        who?: [{
          name: 'Bruno Casali',
          contact: '@brunoocasali',
          email: 'brunoocasali@gmail.com' }],
        start: {
          docs: 'no docs, for a while',
          why: 'So that Zueira NEVER ends.',
          end_points: 'TODO',
          home_page: 'https://github.com/zueirafc/api'
        }
      }
  end
end
