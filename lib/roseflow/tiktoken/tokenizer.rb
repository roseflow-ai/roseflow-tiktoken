require "pycall"

module Roseflow
  module Tiktoken
    class Tokenizer
      def initialize(model: nil)
        @tokenizer = PyCall.import_module("tiktoken")
        @model = model
        @encoding = @tokenizer.encoding_for_model(@model) if @model
      end

      def encode(input)
        @encoding.encode(input)
      rescue
        raise NoEncodingError, "No encoding found for model #{@model}"
      end

      def decode(input)
        @encoding.decode(input)
      rescue
        raise NoEncodingError, "No encoding found for model #{@model}"
      end

      def count_tokens(messages)
        token_count = 0

        messages.each do |message|
          token_count += tokens_per_message_for_model(@model)

          message.each do |key, value|
            token_count += encode(value).count
            if key == "name"
              token_count += tokens_per_message_for_model(@model)
            end
          end
        end

        token_count += 3 # Every reply is primed with assistant
        return token_count
      end

      private

      def tokens_per_message_for_model(model)
        case model
        when "gpt-4"
          tokens_per_message_for_model("gpt-4-0314")
        when "gpt-3.5-turbo"
          tokens_per_message_for_model("gpt-3.5-turbo-0301")
        when "gpt-4-0314"
          3
        when "gpt-3.5-turbo-0301"
          4
        else
          raise NotImplementedError, "Model #{model} is not supported."
        end
      end

      def tokens_per_name_for_model(model)
        case model
        when "gpt-4"
          tokens_per_message_for_model("gpt-4-0314")
        when "gpt-3.5-turbo"
          tokens_per_message_for_model("gpt-3.5-turbo-0301")
        when "gpt-4-0314"
          1
        when "gpt-3.5-turbo-0301"
          -1
        else
          raise NotImplementedError, "Model #{model} is not supported."
        end
      end
    end
  end
end