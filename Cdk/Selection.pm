package Cdk::Selection;

@ISA	= qw (Cdk);

#
# This creates a new Selection object.
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
   my $choices = Cdk::checkReq ($name, "Choices", $params{'Choices'});
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Selection::New ($title,
					$params{'List'},
					$params{'Choices'},
					$height, $width, $xpos, $ypos,
					$highlight, $box, $shadow);
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
   my @choices		= ();

   # Activate the object...
   if (defined $params{'Input'})
   {
      @choices = Cdk::Selection::Activate ($self->{'Me'}, $params{'Input'});
   }
   else
   {
      @choices = Cdk::Selection::Activate ($self->{'Me'});
   }

   if (! defined $choices[0])
   {
      return;
   }
   else   
   {
      $self->{'Info'} = \@choices;
      return @choices;
   }
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

   return (Cdk::Selection::Inject ($self->{'Me'}, $character));
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
   Cdk::Selection::Bind ($self->{'Me'}, $key, $params{'Function'});
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
   Cdk::Selection::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Selection::PostProcess ($self->{'Me'}, $params{'Function'});
}

#
# This sets certain attributes of the selection list.
#
sub set
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $highlight = Cdk::checkReq ($name, "Highlight", $params{'Highlight'});
   my $defChoices = Cdk::checkReq ($name, "Defaults", $params{'Defaults'});
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");

   Cdk::Selection::Set ($self->{'Me'}, $highlight, $params{'Defaults'}, $box);
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
   Cdk::Selection::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Selection::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Selection::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Selection::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Selection::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Selection::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Selection::GetWindow ($self->{'Me'});
}

1;
