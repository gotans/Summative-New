#Create S3 Bucket and static website
resource "aws_s3_bucket" "Summative_Assessment" {
  bucket   = var.bucket_name
  acl      = "public-read"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.Summative_Assessment.bucket
  key          = "index.html"
  source       = "html/index.html"
  content_type = "text/html"
  etag         = md5(file("html/index.html"))
  acl          = "public-read"
}
