# Mura Training Docker Image

The [Mura Training Docker Image](https://hub.docker.com/r/digitalmine/mura-training) is specifically used for Official Mura Training.

## Docker Images

* [The "*Official*" Mura Docker Container](https://hub.docker.com/r/blueriver/mura/)
* [The "*Official*" Ortus Solutions CommandBox Container](https://hub.docker.com/r/ortussolutions/commandbox)

## Get Up & Running

[Docker Desktop](https://www.docker.com/products/docker-desktop) must installed and running on your computer (*Desktop Community* edition is perfectly fine) prior to following the steps below.

## After Docker Desktop Has Been Installed

Follow the steps outlined below to get the Mura training container up and running.

1. Clone the [Mura Training repository](https://github.com/digitalminellc/mura-training) to your desktop
2. Launch your shell program and `cd` into the cloned `../mura-training/` directory
3. Run the following command:

    ``` bash
    docker-compose up
    ```

    * Docker will then begin to do its thing. *The first time this is run, it will take awhile to finish.*

        ``` bash
        Creating volume "mura-training_vol_mura_training_mysql" with default driver
        Pulling svc_mura_training_mysql (mysql:5.7)...
        5.7: Pulling from library/mysql
        bf5952930446: Pull complete
        8254623a9871: Pull complete
        938e3e06dac4: Pull complete
        ea28ebf28884: Pull complete
        f3cef38785c2: Pull complete
        894f9792565a: Pull complete
        1d8a57523420: Pull complete
        5f09bf1d31c1: Pull complete
        1b6ff254abe7: Pull complete
        74310a0bf42d: Pull complete
        d398726627fd: Pull complete
        Digest: sha256:da58f943b94721d46e87d5de208dc07302a8b13e638cd1d24285d222376d6d84
        Status: Downloaded newer image for mysql:5.7
        Creating mura-training_svc_mura_training_mysql_1 ... done
        Creating mura-training_mura_training_1           ... done
        Attaching to mura-training_svc_mura_training_mysql_1, mura-training_mura_training_1
        svc_mura_training_mysql_1  | 2020-09-04 16:26:36+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 5.7.31-1debian10 started.
        svc_mura_training_mysql_1  | 2020-09-04 16:26:36+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
        svc_mura_training_mysql_1  | 2020-09-04 16:26:36+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 5.7.31-1debian10 started.
        svc_mura_training_mysql_1  | 2020-09-04 16:26:37+00:00 [Note] [Entrypoint]: Initializing database files
        etc ...
        ```

    * Once you see a notification about the `WEB CONTEXT`, the container should be ready and you may proceed to the next step.

        ``` bash
        mura_training_1            | Starting RunWAR 4.1.0
        mura_training_1            | Java version 1.8.0.252 (requires >= 1.8)
        mura_training_1            | HTTP2 Enabled:false
        mura_training_1            | HTTP sslEnable:false
        mura_training_1            | HTTP ajpEnable:false
        mura_training_1            | HTTP warFile exists:true
        mura_training_1            | HTTP warFile isDirectory:true
        mura_training_1            | HTTP background:false
        mura_training_1            | Adding additional lib dir of: /usr/local/lib/serverHome/WEB-INF/lib
        mura_training_1            | ******************************************************************************
        mura_training_1            | Starting - port:8080 stop-port:44971 warpath:file:/app/
        mura_training_1            | context: /  -  version: 4.1.0
        mura_training_1            | web-dirs: ["\/app"]
        mura_training_1            | Log Directory: /usr/local/lib/serverHome/logs
        mura_training_1            | ******************************************************************************
        mura_training_1            | XNIO-Option WORKER_IO_THREADS:8
        mura_training_1            | XNIO-Option CONNECTION_LOW_WATER:1000000
        mura_training_1            | XNIO-Option WORKER_TASK_MAX_THREADS:30
        mura_training_1            | XNIO-Option CONNECTION_HIGH_WATER:1000000
        mura_training_1            | XNIO-Option TCP_NODELAY:true
        mura_training_1            | XNIO-Option WORKER_TASK_CORE_THREADS:30
        mura_training_1            | XNIO-Option CORK:true
        mura_training_1            | Parsing '/usr/local/lib/serverHome/WEB-INF/web.xml'
        mura_training_1            | welcome pages in deployment manager: [index.cfm, index.lucee, index.html, index.htm]
        mura_training_1            | Direct Buffers: true
        mura_training_1            | ******************************************************************************
        mura_training_1            | *** starting 'stop' listener thread - Host: 0.0.0.0 - Socket: 44971
        mura_training_1            | ******************************************************************************
        mura_training_1            | Server is up - http-port:8080 stop-port:44971 PID:187 version 4.1.0
        ```

4. Once the container is ready, launch a browser window and navigate to <http://localhost:8008/](http://localhost:8008/>.
5. If the site only contains an empty home page, navigate to <http://localhost:8008/?appreload&applydbupdates> and the site should then be populated with sample content.

### Stop The Mura Training Container

To stop the container, follow the steps below.

1. Open the shell window where the program is running.
2. On macOS, use `<control>+C`
3. On Windows, use `<⌘>+C`

OR

1. Launch your shell program and `cd` into the cloned `../mura-training/` directory
2. Run the following command:

    ``` bash
    docker-compose down
    ```

### Mura Admin Login Information

This image uses [Mura](https://www.murasoftware.com/), a digital content experience platform. To learn more about Mura, visit <https://www.murasoftware.com/>.

* Admin Login URL: <http://localhost:8008/admin/>
* Username: `admin`
* Password: `admin`

### Lucee Admin Login Information

This image uses [Lucee](https://lucee.org), the leading open-source CFML application server/engine. To learn more about Lucee, visit <https://lucee.org]>.

* Admin Login URL: <http://localhost:8008/lucee/admin/server.cfm>
* Password: `P@55w0rd!`

## Companion Training Files

Official Mura Training uses the following additional resources and files for each segment of training.

* [Mura Documentation](https://docs.getmura.com)
  * Documentation used for each training segment.
* [Content Manager Training](https://github.com/digitalminellc/mura-training/tree/master/www/training/1-admin)
  * Companion files used for the Admin/Content Manager Training segment (1 day / 8 hours)
* [Theme Developer Training](https://github.com/digitalminellc/mura-training/tree/master/www/training/2-theme)
  * Companion files used for the Theme Developer Training segment (1 day / 8 hours)
* [Core Developer Training](https://github.com/digitalminellc/mura-training/tree/master/www/training/3-core)
  * Companion files used for the Core Developer Training segment (3 days / 24 hours)

## Building Your Own Image

If you're attending training, please do *not* make any changes to the [Dockerfile](https://github.com/digitalminellc/mura-training/blob/master/Dockerfile) or [docker-compose.yml](https://github.com/digitalminellc/mura-training/blob/master/docker-compose.yml) file until the conclusion of your training. At that point, feel free to make your desired changes, then simply run the following from your command line:

``` bash
docker-compose build --no-cache
```

To publish on [dockerhub](https://hub.docker.com/):

``` bash
docker push YourDockerUsername/RepositoryName:latest
```

## License

[MIT](LICENSE.md)
