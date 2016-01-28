class WelcomeController < ApplicationController
  skip_before_action :restrict_access
  before_action :make_a_hash

  def index
    respond_with @welcome
  end

  private

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/LineLength
  def make_a_hash
    @welcome =
      {
        name: 'Zueira F.C. API',
        for: 'Zueira Futebol Clube',
        current_version: {
          version: 'v1',
          codename: 'Galatasaray',
          status: 'development'
        },
        who?: {
          team: {
            contact: 'hackers@zueirafc.com',
            members: [{
              name: 'Bruno Casali',
              contact: '@brunoocasali',
              email: 'brunoocasali@gmail.com'
            }]
          }
        },
        start: {
          docs: 'no docs, for a while',
          why: 'We need to keep the zueira in our hearts to cheer this moody life',
          license: 'MIT',
          source: 'https://github.com/zueirafc/api'
        }
      }
  end
end
