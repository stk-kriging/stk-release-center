# stk-release-center

Release tools for STK maintainers.

## Release process

Let's assume that we want to release STK 2.8.0.

### Create release tag

Create the release tag on the maintenance branch of the STK repository:
```
cd ~/repo/github/stk-kriging/stk  # adapt to your setting, of course
git checkout 2.8.x
git tag 2.8.0
git push --tags
```

### Build & copy tarballs

Build the two tarballs and copy them to the `stk-release-center`:
```
make all
cd ~/repo/github/stk-kriging/stk-release-center
./copy-built-tarballs.bash 2.8.0 ~/repo/github/stk-kriging/stk/build
```

### Compute check sums & create release text

Compute the check sums and create the release text in the `stk-release-center`:
```
./compute-checksums.bash 2.8.0
./create-github-release-text.bash 2.8.0
```

### Publish the documentation on Github pages

Easy:
 * Copy the three `md` files and the HTML doc from the unpackaed build to `release/2.8.0`.
 * Remove the badges from `README.md`.
 * Update the symbolic link `latest`.
 * Commit, push.
 

### Create release on Github

Go to the release page on Github:
```
firefox https://github.com/stk-kriging/stk/releases/new?tag=2.8.0
```

Then
 * Set the title to `STK 2.8.0`.
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

