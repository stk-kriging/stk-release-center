# stk-release-center

Release tools for STK maintainers.


## Checking control sums

### Github tarballs

Simply run, from the root of the repository,
```
./check-sums-on-github.bash ${VER}
```

### Sourceforge tarballs

Download manually the tarballs to `./${VER}/download/sourceforge`.

Then `cd` to this directory and:
```
md5sum -c ../../md5-sums
sha256sum -c ../../sha256-sums
```

