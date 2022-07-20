locals {

	user_group_name 		= "user_group"
	pool_name 					= "pool"
	identity_pool_name 	= "identity_pool"

  bucket_name = "b123122344234-itba-cloud-computing"
  path        = "/resources"

	cognito_user_groups = {
		podcasters = {
			pool_name				= "podcasters-${local.pool_name}"
			user_group_name = "podcasters-${local.user_group_name}"
			identity_pool_name = "podcasters-${local.identity_pool_name}"
		}

		listeners = {
			pool_name				= "listeners-${local.pool_name}"
			user_group_name = "listeners-${local.user_group_name}"
			identity_pool_name = "listeners-${local.identity_pool_name}"
		}
	}

  s3 = {

    # 1 - Website
    website = {
      bucket_name = local.bucket_name
      path        = "/resources"

      objects = {
        error = {
          filename     = "html/error.html"
          content_type = "text/html"
        }
      }
    }

    # 2 - WWW Website
    www-website = {
      bucket_name = "www.${local.bucket_name}"
    }
  }
}