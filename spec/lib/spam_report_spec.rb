require 'spec_helper'
require 'sendgrid_cli'

module SendgridCli
  describe SpamReport do
    let(:email) { 'test@example.com' }

    subject { SendgridCli::SpamReport.new(email, 'password') }

    describe '#get' do
      it 'call super with correct arugments' do
        SendgridCli::Interface.any_instance.should_receive(:get).with('spamreports', 'get', email)
        subject.get(email)
      end
    end

    describe '#delete' do
      it 'should return a successful status' do
        SendgridCli::Interface.any_instance.should_receive(:delete).with('spamreports', 'get', email)
        subject.delete(email)
      end
    end

  end
end