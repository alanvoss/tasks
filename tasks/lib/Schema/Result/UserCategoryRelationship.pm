package Schema::Result::UserCategoryRelationship;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('user_category_relationship');
__PACKAGE__->add_columns(
   'user_category_relationship_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'parent_user_category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'child_user_category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
);

__PACKAGE__->set_primary_key('user_category_relationship_id');
__PACKAGE__->add_unique_constraint(['child_user_category_id']);

__PACKAGE__->belongs_to('parent_user_category_id', 'Schema::Result::UserCategory');
__PACKAGE__->belongs_to('child_user_category_id', 'Schema::Result::UserCategory');

1;
