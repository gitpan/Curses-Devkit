package Cdk::Viewer;

@ISA	= qw (Cdk);

#
# This creates a new Viewer object.
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
   my $buttons = Cdk::checkReq ($name, "Buttons", $params{'Buttons'});
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "TRUE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Viewer::New ($params{'Buttons'},
					$height, $width, $highlight,
					$xpos, $ypos,
					$box, $shadow);
   bless $self;
}

#
# This activates the viewer.
#
sub activate
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::activate";
 
   # Activate the object...
   $self->{'Info'} = Cdk::Viewer::Activate ($self->{'Me'});
   return ($self->{'Info'});
}

#
# This sets the contents of the information.
#
sub set
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $title = Cdk::checkReq ($name, "Title", $params{'Title'});
   my $list = Cdk::checkReq ($name, "Info", $params{'Info'});
   my $highlight = Cdk::checkDef ($name, "Highlight", $params{'Highlight'}, "A_REVERSE");
   my $interp = Cdk::checkDef ($name, "Interp", $params{'Interp'}, "TRUE");
   my $box = Cdk::checkDef ($name, "Box", $params{'Box'}, "BOX");

   # Set the contents of the object.
   Cdk::Viewer::Set ($self->{'Me'}, $title, $params{'Info'}, $highlight, $interp, $box);
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
   Cdk::Viewer::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Viewer::Erase ($self->{'Me'});
}

#
# This allows us to bind a key to an action.
#
sub bind
{
   my $self     = shift;
   my %params   = @_;
   my $name     = "$self->{'Type'}::bind";

   # Set the values.
   my $key = Cdk::checkReq ($name, "Key", $params{'Key'});
   my $function = Cdk::checkReq ($name, "Function", $params{'Function'});
   Cdk::Entry::Bind ($self->{'Me'}, $key, $params{'Function'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Viewer::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Viewer::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Viewer::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Viewer::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Viewer::GetWindow ($self->{'Me'});
}

1;
