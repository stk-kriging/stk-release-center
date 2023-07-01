# stk-release-center

Release tools for STK maintainers.


## Release process

Let's assume that we want to release STK 2.8.1:
```
VER=2.8.1
```

Let's also assume that the `stk` and `stk-release-center` repositories
have both been cloned into the same directory, say, `~/repo/github/stk-kriging`.


### Check that everything is ready

Check that the version number is correct in `stk_version.m`.

Check that `NEWS.md` is up-to-date and good looking.


### Create release tag

Create the release tag on the maintenance branch of the STK repository:
```
cd ~/repo/github/stk-kriging/stk  # adapt to your setting, of course
git checkout 2.8.x
git tag ${VER}
git push --tags
```

### Build & copy tarballs

Build the two tarballs and copy them to the `stk-release-center`:
```
make all
cd ~/repo/github/stk-kriging/stk-release-center
./copy-built-tarballs.bash ${VER} ~/repo/github/stk-kriging/stk/build
```

### Compute check sums & create release text

Compute the check sums and create the release text in the `stk-release-center`:
```
./compute-checksums.bash ${VER}
./create-github-release-text.bash ${VER}
```

### Publish the documentation on Github pages

Easy:
 * Copy the three `md` files and the HTML doc from the unpackaed build to `release/${VER}`.
   * Remove the badges from `README.md`.
 * Update the symbolic link `latest`.
 * Commit, push.
 

### Create release on Github

Go to the release page on Github:
```
firefox https://github.com/stk-kriging/stk/releases/new?tag=${VER}
```

Then
 * Set the title to `STK ${VER}`.
 * Copy-paste the release text from `release.md`.
 * The box "Set as a pre-release" should be unchecked (this is the default)
 * The box "Set as the latest release" should be checked (this is the default).
 * Upload the tarballs.
 * Click on "Publish release".


## Checking control sums

### Computing checksums for Github tarballs

Simply run, from the root of the repository,
```
./check-sums-on-github.bash ${VER}
```
which will create two files:
```
./${VER}/md5-sums
./${VER}/sha256-sums
```

### Checking checksums for Sourceforge tarballs

Download manually the tarballs to `./${VER}/download/sourceforge`.

Then `cd` to this directory and compare with Github checksums:
```
md5sum -c ../../md5-sums
sha256sum -c ../../sha256-sums
```

