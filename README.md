# Mura Training Docker Image

The [Mura Training Docker Image](https://hub.docker.com/r/stevewithington/mura-training) is specifically used for Official Mura Training.

**Please Note:** If you're looking for the "*Official*" Mura Docker image, please visit https://hub.docker.com/r/blueriver/muracms/.

# Get Up & Running
Assuming you have [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running on your computer (*Desktop Community* edition is perfectly fine), follow the steps below.

1. Clone the [Mura Training repository](https://github.com/stevewithington/mura-training) to your desktop
2. Launch your shell program and run `$ docker-compose up` from within the cloned `../mura-training/mura-docker/` directory
3. Once the image is up and running, launch a browser and navigate to http://localhost:8008/ to view the site.

## Mura Login Information

* Admin: http://localhost:8008/admin/
* Username: `admin`
* Password: `P@55w0rd!`

## Lucee Login Information

* Admin: http://localhost:8888/lucee/admin/server.cfm
* Password: `P@55w0rd!`


# Companion Training Files

Official Mura Training uses the following additional resources and files for each segment of training.

* [Mura Documentation](https://docs.getmura.com)
    * This is the documentation used for each training segment.
* [Content Manager Training](https://github.com/stevewithington/mura-training/tree/master/companion-files/1-admin)
    * These files are used for the Admin/Content Manager Training segment (1 day)
* [Theme Developer Training](https://github.com/stevewithington/mura-training/tree/master/companion-files/2-theme)
    * These files are used for the Theme Developer Training segment (1 day)
* [Core Developer Training](https://github.com/stevewithington/mura-training/tree/master/companion-files/3-core)
    * These files are used for the Core Developer Training segment (3 days)

# Building Your Own Image
Make your desired changes, then run:
`$ docker-compose build --no-cache`
