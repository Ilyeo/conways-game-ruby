# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/telescope'

describe Telescope do
  it 'watches an universe' do
    _(Telescope).must_respond_to :watch
  end
end
