
# Architecture requirement
- Rely on Amazon S3 to provide object storage for static files (no dynamic content)
- Objects are stored with their corresponding metadata
- An Amazon S3 Bucket 

# Steps
1. Create a terraform.tf file where the required providers are defined, as well as its configuration (credentials, region, profile etc...)
2. Create an Amazon S3 bucket with making sure the name is unique
3. Provide index and error html files in aws_s3_bucket_website_configuration
4. Allow public access using aws_s3_bucket_public_access_block 
5. Assign public read get object policy using aws_s3_bucket_policy
6. Upload html files using the resource aws_s3_object  
