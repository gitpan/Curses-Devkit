package Cdk::Debug;

@ISA	= qw (Cdk);

#
# This creates a new Label object
#
sub DumpScreenRegList
{
   my $type		= shift;
   my %params		= @_;
   my $self		= {};
   my $name		= "${type}::new";
   
   # Retain the type of the object.
   $self->{'Type'}	= $type;
   
   # Set up the parameters passed in.
   my $mesg = Cdk::checkReq ("($name) Missing 'Mesg' value.", $params{'Mesg'});

   # Call the thing.
   Cdk::Debug::DumpScreenRegList ($params{'Mesg'}, $mesg);
}

1;
