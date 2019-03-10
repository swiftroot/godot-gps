/*
ios_device.h 
Copyright (c) 2019 Alek Mlynek, Swift Root Inc.

Obj-C interface for IOSGPS. A class that uses the Apple 
DeviceCheck SDK and returns the result in a GDScript callback.
*/

#import "app_delegate.h"
#import <CoreLocation/CoreLocation.h>

@interface IOSGPS : NSObject {
	int instanceId;
	CLLocationManager locationManager;
}

- (void) setInstanceId: (int)pInstanceId;
- (bool) isSupported;
@end

