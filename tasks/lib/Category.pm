package Category;

use strict;
use warnings;

use Moose;

has 'parent' => (
   is  => 'rw',
   isa => 'Category',
);

has 'category' => (
   is  => 'rw',
   isa => 'Str',
   required => 1,
);

no Moose;
__PACKAGE__->meta->make_immutable;
