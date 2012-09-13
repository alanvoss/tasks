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
   'category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'parent_id' => {
      data_type => 'INT',
      is_nullable => 1,
      default_value => undef,
   },
   'user_id' => {
      data_type => 'INT',
      is_nullable => 0,
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
__PACKAGE__->has_many(subtasks => 'Schema::Result::Task', 'parent_id');
__PACKAGE__->belongs_to(user => 'Schema::Result::User', 'user_id');
__PACKAGE__->belongs_to(category => 'Schema::Result::Category', 'category_id');
__PACKAGE__->belongs_to(parenttask => 'Schema::Result::Task', 'parent_id');

1;
