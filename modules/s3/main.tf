resource "aws_s3_bucket" "artifacts" {
  bucket = var.artifacts_bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_ownership_controls" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  rule {
    object_ownership = var.allow_artifacts_bucket_acls ? "BucketOwnerPreferred" : "BucketOwnerEnforced"
  }

}

resource "aws_s3_bucket_acl" "artifacts" {
  count = var.allow_artifacts_bucket_acls ? 1 : 0

  bucket     = aws_s3_bucket.artifacts.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.artifacts]
}

resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket                  = aws_s3_bucket.artifacts.id
  block_public_acls       = !var.allow_artifacts_bucket_acls
  ignore_public_acls      = !var.allow_artifacts_bucket_acls
  restrict_public_buckets = true
  block_public_policy     = true
}

resource "aws_s3_bucket" "gitlab_runner" {
  count  = var.create_gitlab_runner_bucket ? 1 : 0
  bucket = var.gitlab_runner_bucket_name
}

resource "aws_s3_bucket_public_access_block" "gitlab_runner" {
  count                   = var.create_gitlab_runner_bucket ? 1 : 0
  bucket                  = aws_s3_bucket.gitlab_runner[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "gitlab_runner" {
  count  = var.create_gitlab_runner_bucket ? 1 : 0
  bucket = aws_s3_bucket.gitlab_runner[0].id
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
          "${aws_s3_bucket.gitlab_runner[0].arn}/*",
          "${aws_s3_bucket.gitlab_runner[0].arn}"
        ]
      }
    ]
  })
}
