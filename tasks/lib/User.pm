package User;

use strict;
use warnings;

use Moose;

has 'user' => (
   is  => 'rw',
   isa => 'Str',
);

no Moose;
__PACKAGE__->meta->make_immutable;
