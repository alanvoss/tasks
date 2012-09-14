package Schema::Result::Category;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('categories');
__PACKAGE__->add_columns(
   'category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'category' => {
      data_type => 'VARCHAR',
      is_nullable => 0,
      size => 255,
      default_value => undef,
   }
);

__PACKAGE__->set_primary_key('category_id');
__PACKAGE__->add_unique_constraint(['category']);

# users that have this category currently defined
__PACKAGE__->has_many('user_categories' => 'Schema::Result::UserCategory', 'category_id');
__PACKAGE__->many_to_many('users' => 'user_categories', 'user_id');

1;
