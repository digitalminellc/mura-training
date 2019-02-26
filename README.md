# Mura Training Docker Image

The [Mura Training Docker Image](https://hub.docker.com/r/stevewithington/mura-training) is specifically used for Official Mura Training.

**Please Note:** If you're looking for the "*Official*" Mura Docker image, please visit https://hub.docker.com/r/blueriver/muracms/.

# Get Up & Running

First, clone the [Mura Training repository](https://github.com/stevewithington/mura-training) to your desktop. Then, launch your shell program and run `$ docker-compose up` from within the cloned `../mura-training/mura-docker/` directory.

# Companion Training Files

Official Mura Training uses the following additional resources and files for each segment of training.

* [Mura Documentation](https://docs.getmura.com)
    * This is the documentation used for each training segment.
* [Content Manager Training](https://github.com/stevewithington/mura-training/tree/master/1-admin)
    * These files are used for the Admin/Content Manager Training segment (1 day)
* Theme Developer Training (*Coming soon*)
    * These files are used for the Theme Developer Training segment (1 day)
* Core Developer Training (*Coming soon*)
    * These files are used for the Core Developer Training segment (3 days)

# Building Your Own Image
Make your desired changes, then run:
`$ docker-compose build --no-cache`
