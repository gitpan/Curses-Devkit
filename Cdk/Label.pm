package Cdk::Label;

@ISA	= qw (Cdk);

#
# This creates a new Label object
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
   my $mesg = Cdk::checkReq ($name, "Mesg", $params{'Mesg'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Label::New ($params{'Mesg'}, $ypos, $xpos, $box, $shadow);
   bless  $self;
}

#
# This creates a new Label object
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $mesg = Cdk::checkReq ($name, "Mesg", $params{'Mesg'});
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");

   Cdk::Label::Set ($self->{'Me'}, $mesg, $box);
}
   
#
# This draws the label object.
#
sub draw
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::draw";

   # Set up the parameters passed in.
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");

   # Draw the object.
   Cdk::Label::Draw ($self->{'Me'}, $box);
}

#
# This erases the object from the screen.
#
sub erase
{
   my $self	= shift;
   Cdk::Label::Erase ($self->{'Me'});
}

#
# This gives the user the ability to wait until a key is hit.
#
sub wait
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::wait";

   # Set up the parameters passed in.
   my $key = Cdk::checkDef ($name, "Key", $params{'Key'}, '');

   # Sit and wait.
   Cdk::Label::Wait ($self->{'Me'}, $key);
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Label::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Label::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Label::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Label::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Label::GetWindow ($self->{'Me'});
}

1;
