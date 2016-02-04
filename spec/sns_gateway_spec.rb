require 'spec_helper'

describe SnsGateway do
  describe '#new' do
    let(:subject) do
      SnsGateway.new do
        aws_key 'key'
        aws_secret 'secret'
        region 'us-west-2'
        arn 'arn'
        device_token 'token'
        message 'Lorem Ipsum'
      end
    end

    it { is_expected.to have_attributes(:aws_key => "key") }
    it { is_expected.to have_attributes(:aws_secret => "secret") }
    it { is_expected.to have_attributes(:region => "us-west-2") }
    it { is_expected.to have_attributes(:arn => "arn") }
    it { is_expected.to have_attributes(:device_token => "token") }
    it { is_expected.to have_attributes(:message => "Lorem Ipsum") }
  end
end
