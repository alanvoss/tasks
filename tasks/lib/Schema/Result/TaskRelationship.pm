package Schema::Result::TaskRelationship;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('task_relationship');
__PACKAGE__->add_columns(
   'task_relationship_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'parent' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'child' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
);

__PACKAGE__->set_primary_key('task_relationship_id');
__PACKAGE__->belongs_to(parent => 'Schema::Result::Task');
__PACKAGE__->belongs_to(child  => 'Schema::Result::Task');

1;
