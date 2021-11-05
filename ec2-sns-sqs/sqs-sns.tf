resource "aws_sqs_queue" "sqs_queue" {
  name = "sqs_queue"
}

resource "aws_sns_topic" "sns_topic" {
  name = "sns_topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = var.sns_email_subscription
}