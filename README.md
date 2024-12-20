# Written question and answer bots

## Intro

An application which posts to Mastodon and Bluesky, importing questions, written statements etc from data APIs.

## Technical

This app uses Ruby on Rails, dependency management via bundler.

Ruby version management can use `rvm` or `asdf` out of the box. Note that if installing ruby versions (3.3.6 for example) on macOS, you may need to add the open ssl directory manually.

### Ruby install using rvm

Usually you can install new ruby versions with 

```
rvm install 3.3.6
```

However this can fail on some macOS installations. To remedy this:

Make sure open ssl v3 is installed using `brew`

```
brew install openssl@3
```

and then get the installation path where this is installed.

```
brew --prefix openssl@3
```

and finally try installing rvm like this

```
rvm install 3.3.6 --with-openssl-dir=[Put the openssl install dir here]
```

You might be able to get away with this if running `bash`

```
rvm install 3.2.2 --with-openssl-dir=$(brew --prefix openssl@3)
```

### Javascript

There is no javascript pipeline

### Github actions

GitHub actions should be enabled
