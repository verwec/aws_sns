require 'aws-sdk-core'

class SnsGateway

  attr_writer :aws_key, :aws_secret, :region, :arn, :device_token, :message

  def self.deliver(&block)
    gateway = SnsGateway.new(&block)
    gateway.deliver
  end

  def initialize(&block)
    instance_eval(&block) if block
  end

  [:aws_key, :aws_secret, :region, :arn, :device_token, :message].each do |name|
    define_method name do |text=nil|
      instance_var = self.instance_variable_get("@#{name}")
      return instance_var if instance_var
      self.send("#{name}=", text)
    end
  end

  def deliver
    setup_aws
    publish_message
  end

  private

  def setup_aws
    Aws.config[:credentials] = Aws::Credentials.new(aws_key, aws_secret)
    Aws.config[:region] = region
  end

  def publish_message
    sns_client.publish(target_arn: target_arn, message: message)
  end

  def target_arn
    @target_arn ||= begin
      endpoint = sns_client.create_platform_endpoint(
        platform_application_arn: arn,
        token: device_token,
      )
      endpoint[:endpoint_arn]
    end
  end

  def sns_client
    @sns ||= Aws::SNS::Client.new
  end
end
