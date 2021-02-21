data "aws_iam_policy_document" "flow_logs" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]
  }
}

data "aws_iam_policy_document" "flow_logs_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "vpc-flow-logs.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "flow_logs" {
  name               = "flow-logs-${aws_vpc.bean.id}"
  assume_role_policy = data.aws_iam_policy_document.flow_logs_assume_role.json
  tags               = var.iam_tags
}

resource "aws_iam_policy" "flow_logs" {
  name   = "flow-logs-${aws_vpc.bean.id}"
  policy = data.aws_iam_policy_document.flow_logs.json
}

resource "aws_iam_role_policy_attachment" "flow_logs" {
  role       = aws_iam_role.flow_logs.name
  policy_arn = aws_iam_policy.flow_logs.arn
}

resource "aws_flow_log" "bean" {
  log_destination = "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:flow-log-${aws_vpc.this.id}"
  iam_role_arn    = aws_iam_role.flow_logs.arn
  vpc_id          = aws_vpc.bean.id
  traffic_type    = "ALL"
  tags            = var.tags
}
