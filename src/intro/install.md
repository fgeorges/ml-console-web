# Installation

## mlproj

The Console uses `mlproj` as its project manager.  To install it, just use the
following (or read the full [install notes](http://mlproj.org/doc/install)):

```
npm install mlproj -g
```

## Download

Clone or download
the [GitHub repository](https://github.com/fgeorges/expath-ml-console).

The branch `master` corresponds to the latest stable release, whilst `develop`
is the main development branch.  For the latest features and bug fixes, use
`develop`.

## Do it!

To create the Console own databases and app server, execute the following from
the download directory (the one containing the `src/` directory):

```
mlproj -e prod setup
mlproj -e prod deploy
```

It installs the Console on `localhost`, on port 8010, with user "`admin/admin`".
You can now access the Console
on [http://localhost:8010/](http://localhost:8010/).

## Details

If you want the app server to get the modules from the file system, instead of
creating a modules database, use the `dev` environment:

```
mlproj -e dev setup
mlproj -e dev deploy
```

You can also override the host and/or the port number on the command line (use
`-z` to get prompted for the password):

```
mlproj -e prod -h newhost -p port:9000 setup
mlproj -e prod -h newhost deploy
```

Instead of overriding some values on the command line every time (e.g. if you
have to change the host name), you can create a new environment file in
`xproject/ml/`, which copies or imports either `dev.json` or `prod.json`, and
set different values as needed.

If you call your environment `default.json`, you don't even have to use the `-e
dev` option on the command line.

See `mlproj help` or http://mlproj.org/ for details.
