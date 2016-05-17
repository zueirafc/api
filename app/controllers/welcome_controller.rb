class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :make_a_hash

  def index
    respond_with @welcome
  end

  private

  def make_a_hash
    @welcome = JSON.parse(File.read('docs/doc.json'))
  end
end
