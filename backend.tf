terraform {
    cloud {
      organization = "HARRYCLOUD"

      workspaces {
        name = "EC2-instance"
      }
    }
}