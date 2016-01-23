use v6;

=begin pod

=head1 NAME

Attribute::Lazy - lazy attribute initialisation

=head1 SYNOPSIS

=begin code

use Attribute::Lazy;

class Foo {
    has $.foo will lazy { "zub" };
}

=end code

=head1 DESCRIPTION

This is based on an experimental trait that was briefly in the Rakudo core.

Attribute::Lazy provides a single C<trait> C<will lazy> that will allow
an attribute with a public accessor (that is one defined with the C<.> twigil,)
to be initialised I<the first time it is accessed> by the result of the supplied
block.  This might be useful if the value may not be used and may be expensive
to calculate (or various other reasons that haven't been thought of.)


=end pod

module Attribute::Lazy {

    my role Builder[Callable $block] {
            method compose(Mu $package) {
                callsame;
                my $attr = self;
                if $attr.has_accessor {
                    my $meth-name = self.name.substr(2);
                    $package.^method_table{$meth-name}.wrap(-> $self {
                        once $attr.set_value($self, $block());
                        callsame;
                    });
                }
            }

    }

    multi sub trait_mod:<will>(Attribute:D $attr, Callable $block, :$lazy!) is export(:DEFAULT) {
        $attr does Builder[$block];
    }

}


# vim: expandtab shiftwidth=4 ft=perl6
