# Added by Javier Fonseca on 20101122-1635
# This file is automatically added by cucumber (as every file /features/../*.rb)
# It allows factories to be used inside features and step definitions.

require 'factory_girl'
#require 'factory_girl/step_definitions'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','..',
  'spec','factories','*.rb'))].each {|f| require f}