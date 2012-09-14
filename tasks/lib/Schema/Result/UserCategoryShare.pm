package Schema::Result::UserCategoryShare;
use base qw/DBIx::Class::Core/;

use strict;
use warnings;

__PACKAGE__->table('user_category_shares');
__PACKAGE__->add_columns(
   'user_category_share_id' => {
      data_type => 'INT',
      is_nullable => 0,
      is_auto_increment => 1,
      default_value => undef,
   },
   'user_category_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
   'user_id' => {
      data_type => 'INT',
      is_nullable => 0,
      default_value => undef,
   },
);

__PACKAGE__->set_primary_key('user_category_share_id');
__PACKAGE__->add_unique_constraint(['user_category_id', 'user_id']);

__PACKAGE__->belongs_to('user_category_id', 'Schema::Result::UserCategory');
__PACKAGE__->belongs_to('user_id', 'Schema::Result::User');

1;
