package tasks;

use strict;
use warnings;

use Dancer ':syntax';
use Dancer::Plugin::DBIC 'schema';
use Dancer::Error;

set serializer => 'JSON';

our $VERSION = '0.1';

my $tasks = {};

hook 'before' => sub {

   unless (param('user')) {
      my $error = Dancer::Error->new(
         code    => 401,
         message => 'No user param submitted with request'
      );

      return $error->render;
   }

   var user = schema->resultset('User')->find_or_create({
      user   => param('user'),
      secret => 'secret',
   });

   var task = schema->resultset('Task')->search({
      user_id => user->user_id,
   });

   #session 'user' => param('user');
   #if (!session('user') && request->path_info !~ m{^/login}) {
   #   request->path_info('/logininvalid')
   #}
};

get '/' => sub {
   my $error = Dancer::Error->new(
      code    => 300,
      message => 'Ambiguous request.  Clarify.' 
   );

   return $error->render;
};

# list all tasks
get '/tasks' => sub {
   my $tasks = task->all;

   my $result = [];
   while (my $task = $tasks->next) {
      my $parenttask = $task->parenttask;

      push @$result, {
         id => $task->task_id,
         self => '/task/' . $task->task_id,
         category => $task->category->category,
         parent => defined $parenttask && $parenttask
            ? '/task/' . $parenttask->id
            : undef,
         task => $task->task,
         children => do {
            my $rs = $task->subtasks;
            my $children = [];
            while (my $child = $rs->next) {
               push @$children, {
               }
            return $children;
         }
      

};

get '/logininvalid' => sub {
   {
      success => 0,
      error => 'You are not logged in.  Exiting.',
   }
};

prefix '/task' => sub {

   # get the details of a specific task
   get '/:name' => sub {
      if (not exists $tasks->{session 'user'}->{ param('name') }) {
         $error_out->();
      }

      $format->( param('name') );
   };

   # create a task
   post '/' => sub {
      my ($highest) = reverse sort keys %{$tasks->{session 'user'} };
      my $next = sprintf('%08d', $highest + 1);
      $tasks->{session 'user'}->{ $next } = {
         parent_id => undef,
         category_id => undef,
         task => param('task'),
      };

      $format->( $next );
   };

   # update a task
   put '/:name' => sub {
      my $task = $tasks->{session 'user'}->{param('name')};

      if (not defined $task) {
         $error_out->();
      }

      $task->{'task'}        = param('task') if defined param('task');
      $task->{'parent_id'}   = param('task') if defined param('parent_id');
      $task->{'category_id'} = param('task') if defined param('category_id');
      $task->{'owner_id'}    = param('task') if defined param('owner_id');

      $format->( param('name') );
   };

   # delete a task
   del '/:name' => sub {
      {success => defined delete $tasks->{session 'user'}->{param('name')} ? 1 : 0 };
   };
};

true;
