class WelcomeController < ApplicationController
  def index
    current_uri = request.original_url

    @welcome =
    {
      name: 'ZueiraFCAPI',
      for: 'ZueiraFC',
      current_version: {
        version: 'v1',
        codename: 'Galatasaray',
        status: 'development'
      },
      who?: [{ name: 'Bruno Casali', contact: '@brunoocasali', email: 'brunoocasali@gmail.com' }],
      start:
        {
          docs: 'no docs, for a while',
          why: 'So that Zueira NEVER ends.',
          end_points: %W(#{current_uri}api/v1/),
          home_page: 'https://github.com/zueirafc/api'
        }
    }

    respond_with @welcome
  end
end
