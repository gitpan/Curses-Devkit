package Cdk::Fselect;

@ISA	= qw (Cdk);

#
# This creates a new file selector object.
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
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $dattrib = Cdk::checkDef ($name, "Dattrib", $params{'Dattrib'}, "</N>");
   my $fattrib = Cdk::checkDef ($name, "Fattrib", $params{'Fattrib'}, "</N>");
   my $lattrib = Cdk::checkDef ($name, "Lattrib", $params{'Lattrib'}, "</N>");
   my $sattrib = Cdk::checkDef ($name, "Sattrib", $params{'Sattrib'}, "</N>");
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, ".");
   my $fieldattr = Cdk::checkDef ($name, "Fieldattr", $params{'Fieldattr'}, "A_NORMAL");
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Fselect::New ($label, $height, $width,
					$dattrib, $fattrib, $lattrib, $sattrib,
					$highlight, $fieldattr, $filler,
					$xpos, $ypos, $box, $shadow);
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
      $self->{'Info'} = Cdk::Fselect::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Fselect::Activate ($self->{'Me'});
   }
   return ($self->{'Info'});
}

#
# This sets the value in the file selector field.
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";

   # Set the values.
   my $directory = Cdk::checkReq ($name, "Directory", $params{'Directory'});
   my $dattrib = Cdk::checkDef ($name, "Dattrib", $params{'Dattrib'}, "</N>");
   my $fattrib = Cdk::checkDef ($name, "Fattrib", $params{'Fattrib'}, "</N>");
   my $lattrib = Cdk::checkDef ($name, "Lattrib", $params{'Lattrib'}, "</N>");
   my $sattrib = Cdk::checkDef ($name, "Sattrib", $params{'Sattrib'}, "</N>");
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $fieldattr = Cdk::checkDef ($name, "Fattrib", $params{'Fieldattr'}, "A_NORMAL");
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, ".");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   # Call the method.
   Cdk::Fselect::Set ($self->{'Me'}, $directory,
			$dattrib, $fattrib, $lattrib, $sattrib,
			$highlight, $fieldattr, $filler, $box);
}

#
# This function allows the user to get the current value from the widget.
#
sub get
{
   my $self	= shift;
   return (Cdk::Fselect::Get ($self->{'Me'}));
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
   Cdk::Fselect::Bind ($self->{'Me'}, $params{'Key'}, $params{'Function'});
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
   Cdk::Fselect::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Fselect::PostProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Fselect::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Fselect::Erase ($self->{'Me'});
}

#
# This cleans the info inside the entry object.
#
sub clean
{
   my $self	= shift;
   Cdk::Fselect::Clean ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Fselect::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Fselect::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Fselect::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Fselect::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Fselect::GetWindow ($self->{'Me'});
}

1;
