# frozen_string_literal: true
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/mini_test'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
