package Cdk::Scale;

#
# This creates a new Scale object
#
sub new
{
   my $type		= shift;
   my %params		= @_;
   my $self		= {};
   my $name		= "${type}::new";
   my $numWidth		= length ($params{'High'}) + 2;

   # Retain the type of the object.
   $self->{'Type'}	= $type;
   
   # Set up the parameters passed in.
   my $label = Cdk::checkReq ($name, "Label", $params{'Label'});
   my $low = Cdk::checkReq ($name, "Low", $params{'Low'});
   my $high = Cdk::checkReq ($name, "High", $params{'High'});
   my $width = Cdk::checkDef ($name, "Width", $params{'Width'}, $numWidth);
   my $inc = Cdk::checkDef ($name, "Inc", $params{'Inc'}, 1);
   my $fastinc = Cdk::checkDef ($name, "Fastinc", $params{'Fastinc'}, 5);
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $lpos = Cdk::checkDef ($name, "Lpos", $params{'Lpos'}, "LEFT");
   my $start = Cdk::checkDef ($name, "Start", $params{'Start'}, $params{'Low'});
   my $fieldattr = Cdk::checkDef ($name, "Fattrib", $params{'Fattrib'}, "A_NORMAL");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Scale::New ($label,
					$start, $low,
					$high, $inc, $fastinc,
					$width, $xpos, $ypos, $lpos,
					$fieldattr, $box, $shadow);
   bless $self;
}

#
# This activates the object.
#
sub activate
{
   my $self             = shift;
   my %params           = @_;
   my $name             = "$self->{'Type'}::activate";

   # Activate the object...
   if (defined $params{'Input'})
   {
      $self->{'Info'} = Cdk::Scale::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Scale::Activate ($self->{'Me'});
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

   return (Cdk::Scale::Inject ($self->{'Me'}, $character));
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
   Cdk::Scale::Bind ($self->{'Me'}, $key, $params{'Function'});
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
   Cdk::Scale::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Scale::PostProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Scale::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Scale::Erase ($self->{'Me'});
}

#
# This sets the object...
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $low = Cdk::checkReq ($name, "Low", $params{'Low'});
   my $high = Cdk::checkReq ($name, "High", $params{'High'});
   my $value = Cdk::checkReq ($name, "Value", $params{'Value'});
   my $box= Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   Cdk::Scale::Set ($self->{'Me'}, $low, $high, $value, $box);
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Scale::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Scale::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Scale::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Scale::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Scale::GetWindow ($self->{'Me'});
}

1;
