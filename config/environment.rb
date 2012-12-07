# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

# Allow erb trim
ActionView::Base.erb_trim_mode='%<>-'
