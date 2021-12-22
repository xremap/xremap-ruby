# frozen_string_literal: true
require 'json'
require 'yaml'
require_relative 'xremap/version'

module Xremap
  def self.generate(dsl)
    config = { keymap: [] }

    # Using instance_variable_get to avoid making an attr_reader a DSL
    dsl.instance_variable_get(:@keymap).each do |keymap|
      unless keymap.remap.empty?
        entry = {
          name: 'xremap-ruby',
          remap: keymap.remap,
        }
        if keymap.application
          entry[:application] = {
            not: keymap.application.not,
            only: keymap.application.only,
          }.compact
        end
        config.fetch(:keymap) << entry
      end
    end

    config = JSON.parse(config.to_json) # stringify keys
    config.to_yaml
  end

  class DSL
    def initialize
      @keymap = []
      @keymap << Keymap.new(remap: {})
    end

    def remap(from, to:)
      @keymap.last.remap[from] = to
    end

    def window(class_not: nil, class_only: nil, &block)
      @keymap << Keymap.new(
        remap: {},
        application: Application.new(
          not: class_not,
          only: class_only,
        ),
      )
      block.call
      @keymap << Keymap.new(remap: {})
    end
  end

  Keymap = Struct.new(:application, :remap, keyword_init: true)
  Application = Struct.new(:not, :only, keyword_init: true)
end
