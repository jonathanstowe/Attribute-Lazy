#!perl6

use v6;

use Test;

use Attribute::Lazy;

class TestPoodle {
    has $.foo will lazy { "foo" };
    # This won't get a builder as it has no accessor
    has $!bar will lazy { "pow" };
    has $.baz will lazy { "zub" };
}

is TestPoodle.new.foo, "foo", "got the value from the block ( basic )";
is TestPoodle.new.baz, "zub", "got the value from the block (another one)";
is TestPoodle.new(foo => "boom").foo, "boom", "but if it is supplied from the constructor, not over-ritten";

done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
