package Cdk::Graph;

@ISA	= qw (Cdk);

#
# This creates a new Graph object.
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
   my $title = Cdk::checkReq ($name, "Title", $params{'Title'});
   my $xtitle = Cdk::checkReq ($name, "Xtitle", $params{'Xtitle'});
   my $ytitle = Cdk::checkReq ($name, "ytitle", $params{'Ytitle'});
   my $height = Cdk::checkReq ($name, "Height", $params{'Height'});
   my $width = Cdk::checkReq ($name, "Width", $params{'Width'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");

   # Create the thing.
   $self->{'Me'} = Cdk::Graph::New ($title, $xtitle, $ytitle, $height, $width, $xpos, $ypos);
   bless  $self;
}

#
# This sets the objects values.
#
sub set
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $vals = Cdk::checkReq ($name, "Values", $params{'Values'});
   my $graphChars = Cdk::checkReq ($name, "Graphchars",  $params{'Graphchars'});
   my $startAtZero = Cdk::checkDef ($name, "StartAtZero", $params{'StartAtZero'}, "TRUE");
   my $plotType = Cdk::checkDef ($name, "Plottype", $params{'Plottype'}, "LINE");

   # Store the information in both the object and Perl's stack.
   $self->{'Info'} = Cdk::Graph::Set ($self->{'Me'}, 
				$params{'Values'}, $graphChars,
				$startAtZero, $plotType);
   return $self->{'Info'};
}

#
# This draws the object.
#
sub draw
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::draw";

   # Draw the object.
   Cdk::Graph::Draw ($self->{'Me'});
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Graph::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Graph::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Graph::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Graph::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Graph::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Graph::GetWindow ($self->{'Me'});
}

1;
