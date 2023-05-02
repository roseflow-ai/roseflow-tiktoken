# frozen_string_literal: true

require_relative "tiktoken/version"
require "roseflow/tiktoken/tokenizer"

module Roseflow
  module Tiktoken
    class Error < StandardError; end
    class NoEncodingError < StandardError; end
  end
end
