# stk-release-center

Release tools for STK maintainers.


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

