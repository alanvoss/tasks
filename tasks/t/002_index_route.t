use Test::More tests => 2;
use strict;
use warnings;
use Data::Dumper;
srand($$|time);

# the order is important
use tasks;
use Dancer ':tests';
use Dancer::Test;

my $user = 'test';

route_exists [GET => '/'], 'a route handler is defined for /';
response_status_is ['GET' => '/'], 200, 'response status is 200 for /';

# store number of current tasks
my $number_tasks_start = get_number_of_tasks();

# create a task
my $test_tasks = [
   'Do laundry ' . (int(rand(1000)) + 1),
   'Do dishes ' . (int(rand(1000)) + 1),
];
my $id1 = create_task($test_tasks->[0]);
diag($id1 . ' is the id of the first task');

# check task
is(get_task($id1)->{task}, $test_tasks->[0], 'It returned ' . $test_tasks->[0]);

# create another task
# check task
# test there are now 2 more tests that when started
# modify the task
# make sure it isn't like the first task
# list a task
# delete a task
# test there are now 1 more tests that when started

sub get_number_of_tasks {
   response_status_is ['GET' => '/tasks'], 200, 'response status is 200 for /tasks';
   my $tasks = json_response(dancer_response GET => '/tasks');
diag Dumper($tasks);
   return scalar keys %{ $tasks };
}

sub create_task {
   my ($task) = @_;
   my $task_response = json_response(dancer_response POST => '/task', { params => { 'task' => $task } });
   ok( exists $task_response->{id}, 'the task that was just created has an id');
   return $task_response->{id};
}

sub get_task {
   my ($id) = @_;
   return json_response(dancer_response GET => '/task/' . $id);
}

sub json_response {
    my ($response) = @_;
    diag('trying this');
    diag $response->{content};
    return to_json $response->{content};
}
