require 'zeus/rails'

class CustomPlan < Zeus::Rails
  def test(*args)
    # can be anything matching Guard::RSpec :results_file option in the Guardf.
    ENV['GUARD_RSPEC_RESULTS_FILE'] = 'tmp/guard_rspec_results.txt'
    super
  end
end

Zeus.plan = CustomPlan.new
