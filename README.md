# aws_sns
Simple wrapper to use with aws sns

# Examples

```
   SnsGateway.deliver do
      aws_key 'your aws key'
      aws_secret 'your secret'
      region 'us-west-2'
      arn 'arn:aws:sns:us-east-1:11112222233333:MyTopic'
      device_token 'device token'
      message 'Lorem Ipsum'
    end

```
