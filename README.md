Amazon SNS is a great service but is not easy to get up and running. Here's how we did it.

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
