package Net::Douban::Collection;
our $VERSION = '0.17';

use Any::Moose;
use Carp qw/carp croak/;
use Net::Douban::Atom;
with 'Net::Douban::Roles::More';

has 'collectionID' => (
    is  => 'rw',
    isa => 'Str',
);

sub get_collection {
    my ( $self, %args ) = @_;
    $args{collectionID} ||= $self->collectionID;
    return Net::Douban::Atom->new(
        $self->collection_url . "/$args{collectionID}" );
}

sub get_user_collection {
    my ( $self, %args ) = @_;
    my $uid = delete $args{userID} or croak "userID needed!";
    exists $args{cat} or croak "cat needed!";
    return Net::Douban::Atom->new( $self->user_url . "/$uid/collection", %args,
    );
}

sub add_collection {
    my ( $self, %args ) = @_;
    croak "post xml needed" unless exists $args{xml};
    return $self->post( $self->collection_url, $args{xml}, );
}

sub put_collection {
    my ( $self, %args ) = @_;
    $args{collectionID} ||= $self->collectionID;
    croak "put xml needed" unless exists $args{xml};
    return $self->put( $self->collection_url . "/$args{collectionID}",
        $args{xml}, );
}

sub delete_collection {
    my ( $self, %args ) = @_;
    $args{collectionID} ||= $self->collectionID;
    return $self->delete( $self->collection_url . "/$args{collectionID}" );

}

no Any::Moose;
__PACKAGE__->meta->make_immutable;
1;
