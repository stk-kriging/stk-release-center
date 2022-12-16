# STK: a Small Toolbox for Kriging

## One toolbox, two flavours

The latest release of STK is 2.7.0 and it comes in two flavours:

 * an "all purpose" release, which is suitable for use both with
   [GNU Octave](http://www.gnu.org/software/octave/)
   and with [Matlab](www.mathworks.com/products/matlab/).
 * an Octave package, for people who want to install and use STK as a
   regular [Octave package](http://www.gnu.org/software/octave/doc/interpreter/Packages.html#Packages).
 
## Quick start with the "all purpose" release

Download and unpack `stk-2.7.0-allpurpose.tar.gz` from this page, and then
run `stk_init.m` in Octave or Matlab.

After that, you should be able to run the examples located in the 'examples'
directory.

For instance, type `stk_example_kb03` to run the third example in the "Kriging
basics" series.

## Using STK as an Octave package

Assuming that you have a working Internet connection, typing `pkg install -forge stk`
(from within Octave) will automatically download the latest STK package tarball from the
[Octave Forge](http://octave.sourceforge.net/stk/index.html)
[file release system](https://sourceforge.net/projects/octave/files/)
and install it for you.

Alternatively, if `stk-2.7.0-octpkg.tar.gz` (obtained from this page) is in the
current directory, you can simply type: `pkg install stk-2.7.0-octpkg.tar.gz`.

After that, you can load STK using `pkg load stk`.

To check that STK is properly loaded, try for instance `stk_example_kb03` to run
the third example in the "Kriging basics" series.

## Documentation

See <http://kriging.sourceforge.net/htmldoc/> for an online version of the documentation.


