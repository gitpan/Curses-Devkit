package Cdk::Itemlist;

@ISA	= qw (Cdk);

#
# This creates a new Itemlist object.
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
   my $info = Cdk::checkReq ($name, "List", $params{'List'});
   my $default = Cdk::checkDef ($name, 'Default', $params{'Default'}, 0);
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $lpos = Cdk::checkDef ($name, "Lpos", $params{'Lpos'}, "LEFT");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Itemlist::New ($params{'Label'},
					$params{'List'},
					$default,
					$xpos, $ypos, $lpos,
					$box, $shadow);
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
      $self->{'Info'} = Cdk::Itemlist::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Itemlist::Activate ($self->{'Me'});
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

   return (Cdk::Itemlist::Inject ($self->{'Me'}, $character));
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
   my $value = Cdk::checkReq ($name, "List", $params{'List'});
   my $default = Cdk::checkDef ($name, 'Default', $params{'Default'}, 0);
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   # Call the method.
   Cdk::Itemlist::Set ($self->{'Me'}, $params{'List'}, $default, $box);
}

#
# This function allows the user to get the current value from the widget.
#
sub get
{
   my $self	= shift;
   return (Cdk::Itemlist::Get ($self->{'Me'}));
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
   Cdk::Itemlist::Bind ($self->{'Me'}, $key, $params{'Function'});
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
   Cdk::Itemlist::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Itemlist::PostProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Itemlist::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Itemlist::Erase ($self->{'Me'});
}

#
# This cleans the info inside the entry object.
#
sub clean
{
   my $self	= shift;
   Cdk::Itemlist::Clean ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Itemlist::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Itemlist::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Itemlist::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Itemlist::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Itemlist::GetWindow ($self->{'Me'});
}

1;
