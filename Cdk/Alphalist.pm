package Cdk::Alphalist;

@ISA	= qw (Cdk);

#
# This creates a new alphalist object.
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
   my $label = Cdk::checkReq ($name, "Label", $params{'Label'});
   my $list = Cdk::checkReq ($name, "List", $params{'List'});
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, ".");
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Alphalist::New ($label, $params{'List'},
					$height, $width, $xpos, $ypos,
					$highlight, $filler, $box, $shadow);
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

   # Activate the object...
   if (defined $params{'Input'})
   {
      $self->{'Info'} = Cdk::Alphalist::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Alphalist::Activate ($self->{'Me'});
   }
   return ($self->{'Info'});
}

#
# This sets the value in the entry field.
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";

   # Set the values.
   my $list = Cdk::checkReq ($name, "List", $params{'List'});
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, ".");
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   # Call the method.
   Cdk::Alphalist::Set ($self->{'Me'}, $list, $filler, $highlight, $box);
}

#
# This allows us to bind a key to an action.
#
sub bind
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::bind";

   # Set the values.
   my $key = Cdk::checkReq ($name, "Key", $params{'Key'});
   my $function	= Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Alphalist::Bind ($self->{'Me'}, $params{'Key'}, $params{'Function'});
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
   Cdk::Alphalist::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Alphalist::PostProcess ($self->{'Me'}, $params{'Function'});
}

#
# This draws the object.
#
sub draw
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::draw";

   # Set the values.
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");
   
   # Draw the object.
   Cdk::Alphalist::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Alphalist::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Alphalist::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Alphalist::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Alphalist::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Alphalist::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Alphalist::GetWindow ($self->{'Me'});
}

1;
