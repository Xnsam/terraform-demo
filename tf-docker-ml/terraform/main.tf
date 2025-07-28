terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0.1"
		}
	}
}

provider "docker" {}

resource "docker_image" "ml_image" {
	name	= "ml_image:latest" 
	build {
		context		= "${path.module}/../ml-proj"
		dockerfile 	= "Dockerfile"
	}
}

resource "docker_container" "ml_container" {
	name 	= "ml_container"
	image 	= docker_image.ml_image.image_id
	ports {
		internal = 5000
		external = 5000
	}

	restart = "unless-stopped"
}


