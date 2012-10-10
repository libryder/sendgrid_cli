require 'spec_helper'
require 'sendgrid_cli'

module SendgridCli
  describe Interface do
    let(:email) { 'test@example.com' }
    let(:api_response) { [{ ip: '127.0.0.1', email: email }] }

    subject { SendgridCli::Interface }

    before { subject.stub(query_api: api_response) }
    
    context 'when gem is not configured' do
      it 'should raise an exception when not configured' do 
        expect { subject.new(nil, nil) }.to raise_error
      end
    end

    context 'when gem is configured' do
      let(:klass) { subject.new(email, 'password') }

      describe '#get' do
        it 'call query_api' do
          klass.should_receive(:query_api).with('spamreports', 'get', email)
          klass.get('spamreports', email)
        end
      end

      describe '#delete' do
        it 'should return a successful status' do
          klass.should_receive(:query_api).with('spamreports', 'delete', email)
          klass.delete('spamreports', email)
        end
      end
    end

  end
end