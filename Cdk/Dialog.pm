package Cdk::Dialog;
require "flush.pl";

@ISA	= qw (Cdk);

#
# This creates a new Dialog object.
#
sub new
{
   my $type		= shift;
   my %params		= @_;
   my $self		= {};
   my $name		= "${type}::new";

   # Retain the type of the object.
   $self->{'Type'} = $type;
   
   # Set up the parameters passed in.
   my $mesg = Cdk::checkReq ($name, "Mesg", $params{'Mesg'});
   my $buttons = Cdk::checkReq ($name, "Buttons", $params{'Buttons'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $seperator = Cdk::checkDef ($name, "Seperator", $params{'Seperator'}, "TRUE");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Dialog::New ($params{'Mesg'},
					$params{'Buttons'},
					$xpos, $ypos,
					$highlight, $seperator,
					$box, $shadow);
   bless $self;
}

#
# This activates the object
#
sub activate
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::activate";

   # Activate the object...
   if (defined $params{'Input'})
   {
      $self->{'Info'} = Cdk::Dialog::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Dialog::Activate ($self->{'Me'});
   }
   return ($self->{'Info'});
}

#
# This injects a character into the widget.
#
sub inject
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::inject";

   # Set the values.
   my $character = Cdk::checkReq ($name, "Input", $params{'Input'});

   return (Cdk::Dialog::Inject ($self->{'Me'}, $character));
}

#
# This allows us to change the personality of the object.
#
sub set
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $highlight = Cdk::checkReq ($name, "Highlight", $params{'Highlight'});
   my $seperator = Cdk::checkReq ($name, "Seperator", $params{'Seperator'});
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   # Activate the object...
   $self->{'Info'} = Cdk::Dialog::Set ($self->{'Me'}, $highlight, $seperator, $box);
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
   Cdk::Dialog::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Dialog::Erase ($self->{'Me'});
}

#
# This allows us to bind a key to an action.
#
sub bind
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::bind";

   # Set up the parameters passed in.
   my $key = Cdk::checkReq ($name, "Key", $params{'Key'});
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   
   # Bind the key to the function
   Cdk::Dialog::Bind ($self->{'Me'}, $key, $function);
}

#
# This allows us to set a pre-process function.
#
sub preProcess
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::preProcess";
 
   # Set the values.
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Dialog::PreProcess ($self->{'Me'}, $params{'Function'});
}

#
# This allows us to set a post-process function.
#
sub postProcess
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::postProcess";
 
   # Set the values.
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Dialog::PostProcess ($self->{'Me'}, $params{'Function'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Dialog::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Dialog::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Dialog::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Dialog::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Dialog::GetWindow ($self->{'Me'});
}

1;
