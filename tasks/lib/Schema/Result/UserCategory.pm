package Schema::Result::UserCategory;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('user_categories');
__PACKAGE__->add_columns(
   'user_category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'user_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
);

__PACKAGE__->set_primary_key('user_category_id');
__PACKAGE__->add_unique_constraint(['user_id', 'category_id']);

__PACKAGE__->belongs_to('user_id' => 'Schema::Result::User');
__PACKAGE__->belongs_to('category_id' => 'Schema::Result::Category');

__PACKAGE__->has_many('parent_user_categories' => 'Schema::Result::UserCategoryRelationship', 'child_user_category_id');
__PACKAGE__->has_many('child_user_categories' => 'Schema::Result::UserCategoryRelationship', 'parent_user_category_id');

1;
