# Log4dev

This is the repository for our blog. It runs over [Github Pages](https://pages.github.com/), using [Jekyll](https://jekyllrb.com/) as it's engine.

## Configuring your development environment

You can choose between two options: [Host]() or [Docker]().

### Host configuration
The easiest way to configure the development environment on your machine is to use [RVM](https://rvm.io/). If you don't have it, [follow RVM's installation instructions](https://rvm.io/rvm/install). Once you have RVM properly installed, then you just need to execute on the project's root folder:

```sh
$ rvm use
$ bundle install
```

If you don't have the proper ruby version installed on RVM, it'll ask you to install it. Follow all instructions that shows up, and make sure you are able to execute both instructions above with no errors. Once you managed to do it, run jekyll's server:

```sh
$ jekyll server
```

This will compile and serve the blog, and then you'll be able to see it on *http://localhost:4000*.

### Docker configuration
Alternatively you can use docker to run the blog, avoiding the need to install anything on your machine (other than Docker). If you have Docker installed, build the docker image:

```sh
$ docker build -t . log4dev.com
```

If the image was successfully built, then you can run the blog:

```sh
$ docker run --rm -it -p 4000:4000 -v $PWD:/usr/src/app log4dev.com
```

