require "spec_helper"
require "erb/indent"

RSpec.describe Erb::Indent do
  it "compiles <%| syntax" do
    erb = <<~ERB
      1
      <%| [2, 3, 4].each do |num| -%>
        <% unless num == 3 -%>
          <%= num %>
        <% end -%>
      <%| end -%>
      5
    ERB
    expect(Erb::Indent.new(erb, nil, "-").result).to eq(<<~EOS)
      1
      2
      4
      5
    EOS
  end
end
