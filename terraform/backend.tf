terraform {
  backend "gcs" {
   bucket = "terraform-rare-mechanic-358909"
   prefix = "vidicore-dev/front-end"
  }  
}