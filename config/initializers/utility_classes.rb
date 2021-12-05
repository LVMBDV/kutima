# frozen_string_literal: true

require 'yaml'

##
# Provides access to utility classes stored in config
class UtilityClassReader
  class TypeKeyNotFound < StandardError; end

  class VariantKeyNotFound < StandardError; end

  def initialize
    @styles = data_from_config
    @last_updated = File.ctime(config_file)
  end

  def for(type, variant: nil)
    reload_config! if config_changed?

    classes = styles.dig(type, :base)
    raise TypeKeyNotFound, "Type key #{type} not found in config" unless classes

    if variant
      variant_classes = styles.dig(type, :variants, variant)
      raise VariantKeyNotFound, "Variant key #{variant} not found in config" unless variant_classes
    end

    variant_classes ? "#{classes} #{variant_classes}" : classes
  end

  private

  attr_reader :styles, :last_updated

  def data_from_config
    YAML.safe_load(File.read(config_file)).deep_symbolize_keys
  end

  def config_file
    Rails.root.join('config/utility_classes.yml')
  end

  def reload_config!
    @styles = data_from_config
    @last_updated = File.ctime(config_file)
  end

  def config_changed?
    return false unless Rails.env.development?

    last_updated != File.ctime(config_file)
  end
end

UtilityClasses = UtilityClassReader.new
