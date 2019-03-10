/*
gps.mm
Copyright (c) 2019 Alek Mlynek, Swift Root Inc.

C++ Class for linking Godot and GPS on iOS devices
*/


#include "gps.h"
#import "app_delegate.h"

// Init
GPS::GPS() {
	instance = this;
}

void GPS::init(int instanceId)
{
	iosGPS = [IOSGPS alloc];
	[iosGPS setInstanceId:instanceId];

}

// Methods
bool GPS::is_supported() {
	return [iosGPS isSupported];
}

void GPS::_bind_methods() {
	ClassDB::bind_method(D_METHOD("is_supported"), &GPS::is_supported);
	ClassDB::bind_method(D_METHOD("init"), &GPS::init);
}



