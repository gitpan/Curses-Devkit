package Cdk::Mentry;

@ISA	= qw (Cdk);

#
# This creates a new Mentry object.
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
   my $label = Cdk::checkReq ($name, "Label", $params{'Label'});
   my $fieldwidth = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $physical = Cdk::checkReq ($name, "Prows", $params{'Prows'});
   my $logical = Cdk::checkReq ($name, "Lrows", $params{'Lrows'});
   my $min = Cdk::checkDef ($name, "Min", $params{'Min'}, 0);
   my $disptype = Cdk::checkDef ($name, "Dtype", $params{'Dtype'}, "MIXED");
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, ".");
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $lpos = Cdk::checkDef ($name, "Lpos", $params{'Lpos'}, "LEFT");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Mentry::New ($label, $min, 
					$physical, $logical, $fieldwidth,
					$disptype, $filler, 
					$xpos, $ypos, $lpos,
					$fieldattr, $box, $shadow);
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
      $self->{'Info'} = Cdk::Mentry::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Mentry::Activate ($self->{'Me'});
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

   return (Cdk::Mentry::Inject ($self->{'Me'}, $character));
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
   my $value = Cdk::checkReq ($name, "Value", $params{'Value'});
   my $min = Cdk::checkDef ($name, "Min", $params{'Min'}, -1);
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   Cdk::Mentry::Set ($self->{'Me'}, $value, $min, $box);
}

#
# This function allows the user to get the current value from the widget.
#
sub get
{
   my $self	= shift;
   return (Cdk::Mentry::Get ($self->{'Me'}));
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
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Mentry::Bind ($self->{'Me'}, $key, $params{'Function'});
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
   Cdk::Mentry::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Mentry::PostProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Mentry::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Mentry::Erase ($self->{'Me'});
}

#
# This cleans the information inside the object.
#
sub clean
{
   my $self	= shift;
   Cdk::Mentry::Clean ($self->{'Me'});
}

1;
