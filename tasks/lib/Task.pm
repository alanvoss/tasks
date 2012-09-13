package Task;

use strict;
use warnings;

use Moose;

has 'owner' => (
   is  => 'rw',
   isa => 'User',
);

has 'parent' => (
   is  => 'rw',
   isa => 'Task',
);

has 'category' => (
   is  => 'rw',
   isa => 'Category',
);

has 'task' => (
   is  => 'rw',
   isa => 'Str',
   required => 1,
);

no Moose;
__PACKAGE__->meta->make_immutable;
