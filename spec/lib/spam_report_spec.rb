require 'spec_helper'
require 'sendgrid_cli'

module SendgridCli
  describe SpamReport do
    subject { SendgridCli::SpamReport.new('test@example.com', 'password') }

    its(:class) { should eq(SpamReport) }
  end
end