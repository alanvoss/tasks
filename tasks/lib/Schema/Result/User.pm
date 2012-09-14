package Schema::Result::User;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('users');
__PACKAGE__->add_columns(
   'user_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'user' => {
      data_type => 'VARCHAR',
      is_nullable => 0,
      default_value => undef,
      size => 100,
   },
   'secret' => {
      data_type => 'VARCHAR',
      is_nullable => 0,
      default_value => undef,
      size => 255,
   },
);

__PACKAGE__->set_primary_key('user_id');
__PACKAGE__->add_unique_constraint(['user']);

__PACKAGE__->has_many('user_categories' => 'Schema::Result::UserCategory', 'user_id');
__PACKAGE__->many_to_many('categories' => 'user_categories', 'category_id');

__PACKAGE__->has_many('user_category_shares' => 'Schema::Result::UserCategoryShare', 'user_id');
__PACKAGE__->many_to_many('category_shares' => 'user_category_shares', 'user_category_id');

__PACKAGE__->has_many('user_tasks' => 'Schema::Result::UserTask', 'user_id');
__PACKAGE__->many_to_many('tasks' => 'user_tasks', 'task_id');

1;
