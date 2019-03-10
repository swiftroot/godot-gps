/*
ios_device.mm 
Copyright (c) 2019 Alek Mlynek, Swift Root Inc.

Obj-C implementation for IOSGPS. A class that uses the Apple 
DeviceCheck SDK and returns the result in a GDScript callback.
*/

#import "ios_gps.h"
#include "core/reference.h"

@implementation IOSGPS
- (void) setInstanceId: (int)pInstanceId {
	instanceId = pInstanceId;
}
- (bool) isSupported {
	return false;
}

@end
