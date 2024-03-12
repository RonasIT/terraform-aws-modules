resource "aws_s3_bucket" "artifacts" {
  bucket = var.artifacts_bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket                  = aws_s3_bucket.artifacts.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "artifacts_bucket_policy" {
  bucket = aws_s3_bucket.artifacts.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.gitlab_runner_user_arn
        }
        Action = [
          "s3:*"
        ]
        Resource = [
          "${aws_s3_bucket.artifacts.arn}/*",
          "${aws_s3_bucket.artifacts.arn}"
        ]
      }
    ]
  })
}

resource "aws_s3_bucket" "gitlab_runner" {
  bucket = var.gitlab_runner_bucket_name
}

resource "aws_s3_bucket_public_access_block" "gitlab_runner" {
  bucket                  = aws_s3_bucket.gitlab_runner.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "gitlab_runner" {
  bucket = aws_s3_bucket.gitlab_runner.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.gitlab_runner_user_arn
        }
        Action = [
          "s3:*"
        ]
        Resource = [
          "${aws_s3_bucket.gitlab_runner.arn}/*",
          "${aws_s3_bucket.gitlab_runner.arn}"
        ]
      }
    ]
  })
}
