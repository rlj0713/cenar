# frozen_string_literal: true

require_relative "../lib/cenar/version"
require_relative "../lib/cenar/cli"
require_relative "../lib/cenar/recipe"
require_relative "../lib/cenar/api"
require "pry"
require "httparty"
require "json"
require "awesome_print"

module Cenar
  class Error < StandardError; end
  # Your code goes here...
end
