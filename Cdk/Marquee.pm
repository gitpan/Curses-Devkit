package Cdk::Marquee;

@ISA	= qw (Cdk);

#
# This creates a new Marquee object.
#
sub new
{
   my $type		= shift;
   my %params		= @_;
   my $self		= {};
   my $name		= "${type}::new";

   # Retain the type of the object.
   $self->{'Type'}	= $type;
   
   # Set up the parameters passed in.
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Marquee::New ($width, $xpos, $ypos, $shadow);
   bless  $self;
}

#
# This activates the object
#
sub activate
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::activate";

   # Set the values.
   my $message = Cdk::checkReq ($name, "Mesg", $params{'Mesg'});
   my $delay = Cdk::checkReq ($name, "Delay", $params{'Delay'});
   my $repeat = Cdk::checkReq ($name, "Repeat", $params{'Repeat'});
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");

   # Store the information in both the object and Perl's stack.
   $self->{'Info'} = Cdk::Marquee::Activate ($self->{'Me'}, $params{'Mesg'}, $delay, $repeat, $box);
   return ($self->{'Info'});
}

#
# This draws the object.
#
sub draw
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::draw";

   # Set up the parameters passed in.
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");
   
   # Draw the object.
   Cdk::Marquee::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Marquee::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Marquee::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Marquee::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Marquee::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Marquee::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Marquee::GetWindow ($self->{'Me'});
}

1;
