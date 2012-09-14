package Schema::Result::UserTask;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('user_tasks');
__PACKAGE__->add_columns(
   'user_task_id' => {
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
   'task_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'parent_user_task_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'complete' => {
      data_type => 'TINYINT',
      is_nullable => 0,
      default_value => 0,
   }
);

__PACKAGE__->set_primary_key('user_task_id');
__PACKAGE__->add_unique_constraint(['user_id', 'task_id']);

__PACKAGE__->belongs_to('user_id', 'Schema::Result::User');
__PACKAGE__->belongs_to('task_id', 'Schema::Result::Task');
__PACKAGE__->belongs_to('parent_user_task_id', 'Schema::Result::UserTask');

1;
