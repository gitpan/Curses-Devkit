package Cdk::Matrix;

@ISA	= qw (Cdk);

#
# This creates a new Matrix object.
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
   my $rowtitles = Cdk::checkReq ($name, "Rowtitles", $params{'Rowtitles'});
   my $coltitles = Cdk::checkReq ($name, "Coltitles", $params{'Coltitles'});
   my $colwidths = Cdk::checkReq ($name, "Colwidths", $params{'Colwidths'});
   my $colvalues = Cdk::checkReq ($name, "Coltypes",  $params{'Coltypes'});
   my $vrows = Cdk::checkReq ($name, "Vrows", $params{'Vrows'});
   my $vcols = Cdk::checkReq ($name, "Vcols", $params{'Vcols'});
   my $xpos = Cdk::checkDef ($name, "Xpos", $params{'Xpos'}, "CENTER");
   my $ypos = Cdk::checkDef ($name, "Ypos", $params{'Ypos'}, "CENTER");
   my $rowspace = Cdk::checkDef ($name, "Rowspace", $params{'Rowspace'}, 1);
   my $colspace = Cdk::checkDef ($name, "Colspace", $params{'Colspace'}, 1);
   my $filler = Cdk::checkDef ($name, "Filler", $params{'Filler'}, ".");
   my $dominant = Cdk::checkDef ($name, "Dominant", $params{'Dominant'}, "NONE");
   my $boxCell = Cdk::checkDef ($name, "Boxcell", $params{'Boxcell'}, "TRUE");
   my $boxMatrix = Cdk::checkDef ($name, "Boxmatrix", $params{'Boxmatrix'}, "FALSE");
   my $shadow = Cdk::checkDef ($name, "Shadow", $params{'Shadow'}, "FALSE");

   # Create the thing.
   $self->{'Me'} = Cdk::Matrix::New ($params{'Rowtitles'},
					$params{'Coltitles'},
					$params{'Colwidths'},
					$params{'Coltypes'},
					$vrows, $vcols, $xpos, $ypos,
					$rowspace, $colspace,
					$filler, $dominant,
					$boxCell, $boxMatrix, $shadow);
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

   # Activate the matrix.
   return (Cdk::Matrix::Activate ($self->{'Me'}));
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

   return (Cdk::Matrix::Inject ($self->{'Me'}, $character));
}

#
# This allows the user to set the matrix values on startup/or change the values.
#
sub set
{
   my $self		= shift;
   my %params		= @_;
   my $name		= "$self->{'Type'}::set";

   # Set up the parameters passed in.
   my $mvalues = Cdk::checkReq ($name, "Values", $params{'Values'});

   # Call the function that does this.
   return (Cdk::Matrix::Set ($self->{'Me'}, $params{'Values'}));
}

#
# This allows the user to clean the matrices cell values.
#
sub clean
{
   my $self	= shift;
   my $name	= "$self->{'Type'}::clean";
   Cdk::Matrix::Clean ($self->{'Me'});
}

#
# This allows the user to dump the matrices cell values.
#
sub dump
{
   my $self	= shift;
   my %params	= @_;
   my $name	= "$self->{'Type'}::flush";
   my $title	= $params{'Title'}	|| "No Title";

   # Call the function that does this.
   Cdk::Matrix::Dump ($self->{'Me'}, $title);
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
   Cdk::Matrix::Draw ($self->{'Me'}, $box);
}

#
# This erases the object.
#
sub erase
{
   my $self	= shift;
   Cdk::Matrix::Erase ($self->{'Me'});
}

#
# This function raises the object.
#
sub raise
{
   my $self	= shift;
   Cdk::Matrix::Raise ($self->{'Me'});
}

#
# This function lowers the object.
#
sub lower
{
   my $self	= shift;
   Cdk::Matrix::Lower ($self->{'Me'});
}

#
# This function registers the object.
#
sub register
{
   my $self	= shift;
   Cdk::Matrix::Register ($self->{'Me'});
}

#
# This function unregisters the object.
#
sub unregister
{
   my $self	= shift;
   Cdk::Matrix::Unregister ($self->{'Me'});
}

#
# This function returns the pointer to the window.
#
sub getwin
{
   my $self	= shift;
   Cdk::Matrix::GetWindow ($self->{'Me'});
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
   Cdk::Matrix::PreProcess ($self->{'Me'}, $params{'Function'});
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
   Cdk::Matrix::PostProcess ($self->{'Me'}, $params{'Function'});
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

   Cdk::Matrix::Bind ($self->{'Me'}, $params{'Key'}, $params{'Function'});
}
1;
