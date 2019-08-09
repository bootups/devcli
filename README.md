# Development CLI

# Problem
As a contractor I often work on different machines: Mac, Linx and Windows. Everytime I start on a new machine I have to use different tools to perform the same tasks. It takes effort to be across all the different tools, and to setup each new machine with those tools.

# Solution
This Docker image enables me to run all my faviourite preconfigured tools on any machine, whereever I am, with minimal effort. Some of the tools used:
* Scan through the Dockerfile to see various libraries used
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Docker CLI support which executes against the host docker daemon
* The following example shows
  * Readable file sizes
  * Colour coding of files depending on their executable bit
  * Git support

![alt text](images/example.png "Logo Title Text 1")

# Usage
## Prerequisites
* zsh is installed
* Install [Powerline](https://github.com/powerline/fonts) fonts
## Build
Build the docker image
```
$ git clone https://github.com/bootups/devcli.git
$ cd devcli/bin
$ build.sh
```
## Run
```
$ cd devcli/bin
$ dsh
```
# Customise
* Add and remove tools to the Dockerfile
* Modify the .zshrc file to add in favourite aliases and functions      