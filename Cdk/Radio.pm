package Cdk::Radio;

@ISA	= qw (Cdk);

#
# This creates a new Radio object.
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
   my $title = Cdk::checkReq ($name, "Title", $params{'Title'});
   my $list = Cdk::checkReq ($name, "List", $params{'List'});
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $choicechar = Cdk::checkDef ($name, "Choice", $params{'Choice'}, "X");
   my $defaultitem = Cdk::checkDef ($name, "Default", $params{'Default'}, 0);
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Radio::New ($title, $params{'List'},
					$height, $width, $xpos, $ypos,
					$choicechar, $defaultItem, $highlight,
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
      $self->{'Info'} = Cdk::Radio::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      $self->{'Info'} = Cdk::Radio::Activate ($self->{'Me'});
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

   return (Cdk::Radio::Inject ($self->{'Me'}, $character));
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
   Cdk::Radio::Bind ($self->{'Me'}, $key, $params{'Function'});
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
   Cdk::Radio::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Radio::PostProcess ($self->{'Me'}, $params{'Function'});
}

#
# This sets some characteristics of the radio list.
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $highlight = Cdk::checkReq ($name, "Highlight", $params{'Highlight'});
   my $choice = Cdk::checkReq ($name, "Choice", $params{'Choice'});
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");
   
   # Draw the object.
   Cdk::Radio::Set ($self->{'Me'}, $highlight, $choice, $box);
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
   Cdk::Radio::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Radio::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Radio::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Radio::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Radio::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Radio::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Radio::GetWindow ($self->{'Me'});
}

1;
