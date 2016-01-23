# Attribute::Lazy 

Lazy attribute initialisation for Perl 6 classes

## Synopsis

```

use Attribute::Lazy;

class Foo {
    has $.foo will lazy { "zub" };
}

```

## Description

This is based on an experimental trait that was briefly in the Rakudo core.

Attribute::Lazy provides a single *trait* *will lazy* that will allow
an attribute with a public accessor (that is one defined with the "." twigil,)
to be initialised *the first time it is accessed* by the result of the supplied
block.  This might be useful if the value may not be used and may be expensive
to calculate (or various other reasons that haven't been thought of.)

## Installation

Assuming you have a working perl6 installation you should be able to
install this with *ufo* :

    ufo
    make test
    make install

*ufo* can be installed with *panda* for rakudo:

    panda install ufo

Or you can install directly with "panda":

    # From the source directory
   
    panda install .

    # Remote installation

    panda install Attribute::Lazy

Other install mechanisms may be become available in the future.

## Support

Suggestions/patches are welcomed via github at

   https://github.com/jonathanstowe/Attribute-Lazy

## Licence

Please see the LICENCE file in the distribution

(C) Rakudo Contributors 2015
(C) Jonathan Stowe 2016
