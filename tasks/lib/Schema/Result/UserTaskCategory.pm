package Schema::Result::UserTaskCategory;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('user_task_categories');
__PACKAGE__->add_columns(
   'user_task_category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'user_task_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'user_category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
);

__PACKAGE__->set_primary_key('user_task_category_id');
__PACKAGE__->add_unique_constraint(['user_task_id', 'user_category_id']);

__PACKAGE__->belongs_to('user_task_id', 'Schema::Result::UserTask');
__PACKAGE__->belongs_to('user_category_id', 'Schema::Result::UserCategory');

1;
