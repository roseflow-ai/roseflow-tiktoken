# frozen_string_literal: true

RSpec.describe Roseflow::Tiktoken do
  it "has a version number" do
    expect(Roseflow::Tiktoken.gem_version).not_to be nil
  end
end
