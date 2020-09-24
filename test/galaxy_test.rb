# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/galaxy'

describe Galaxy do
  it 'returns an instance of galaxy' do
    g = Galaxy.new
    _(g).must_be_instance_of Galaxy
  end

  describe 'alive galaxy' do
    it 'returns 1' do
      g = Galaxy.new(1)
      _(g.state).must_equal 1
    end

    it 'destroys an alive galaxy' do
      g = Galaxy.new(1)
      g.destroy!
      _(g).must_respond_to :destroy!
      _(g.state).must_equal 0
    end
  end

  describe 'dead galaxy' do
    it 'returns 0' do
      g = Galaxy.new(0)
      _(g.state).must_equal 0
    end

    it 'spawn a dead galaxy' do
      g = Galaxy.new(0)
      g.spawn!
      _(g).must_respond_to :spawn!
      _(g.state).must_equal 1
    end
  end
end
