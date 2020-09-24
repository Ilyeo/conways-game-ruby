# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/god'
require_relative '../lib/galaxy'

describe God do
  describe 'underpopulation' do
    before do
      @g = Galaxy.new(1) # live galaxy
    end

    it 'galaxy dies' do
      @g.set_neighborhood_size(1)
      God.destiny!(@g)
      _(@g.alive?).must_equal false
    end
  end

  describe 'survive' do
    before do
      @g = Galaxy.new(1) # live galaxy
    end

    it 'galaxy lives' do
      @g.set_neighborhood_size(3)
      God.destiny!(@g)
      _(@g.alive?).must_equal true
    end
  end

  describe 'overpopulation' do
    before do
      @g = Galaxy.new(1) # live galaxy
    end

    it 'galaxy dies' do
      @g.set_neighborhood_size(4)
      God.destiny!(@g)
      _(@g.alive?).must_equal false
    end
  end

  describe 'reproduction' do
    before do
      @g = Galaxy.new # dead galaxy
    end

    it 'galaxy dies' do
      @g.set_neighborhood_size(3)
      God.destiny!(@g)
      _(@g.alive?).must_equal true
    end
  end
end
