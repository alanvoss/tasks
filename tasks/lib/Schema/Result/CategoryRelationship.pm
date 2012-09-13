package Schema::Result::CategoryRelationship;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('category_relationship');
__PACKAGE__->add_columns(
   'category_relationship_id' => {
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

__PACKAGE__->set_primary_key('category_relationship_id');
__PACKAGE__->belongs_to(parent => 'Schema::Result::Category');
__PACKAGE__->belongs_to(child  => 'Schema::Result::Category');

1;
