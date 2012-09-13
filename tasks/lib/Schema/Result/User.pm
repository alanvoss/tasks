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
__PACKAGE__->has_many(tasks => 'Schema::Result::Task', 'user_id');

1;
