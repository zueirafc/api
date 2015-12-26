class WelcomeController < ApplicationController
  before_action :make_a_hash

  def index
    respond_with @welcome
  end

  private

  def make_a_hash
    @welcome =
    { name: 'ZueiraFCAPI', for: 'ZueiraFC',
      current_version: { version: 'v1', codename: 'Galatasaray',
                         status: 'development' },
      who?: [{ name: 'Bruno Casali', contact: '@brunoocasali',
               email: 'brunoocasali@gmail.com' }],
      start: { docs: 'no docs, for a while', why: 'So that Zueira NEVER ends.',
               end_points: %W(#{request.original_url}api/v1/clubs
                              #{request.original_url}api/v1/users),
               home_page: 'https://github.com/zueirafc/api' }
    }
  end
end
