package Schema::Result::Task;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('tasks');
__PACKAGE__->add_columns(
   'task_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'task' => {
      data_type => 'VARCHAR',
      is_nullable => 0,
      default_value => undef,
      size => 255,
   }
);

__PACKAGE__->set_primary_key('task_id');
__PACKAGE__->add_unique_constraint(['task']);

__PACKAGE__->has_many('user_tasks' => 'Schema::Result::UserTask', 'task_id');
__PACKAGE__->many_to_many('users' => 'user_tasks', 'user_id');

1;
