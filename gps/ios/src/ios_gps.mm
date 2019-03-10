/*
ios_device.mm 
Copyright (c) 2019 Alek Mlynek, Swift Root Inc.

Obj-C implementation for IOSGPS. A class that uses the Apple 
GPS SDK and returns the result in a GDScript callback.
*/

#import "ios_gps.h"
#include "core/reference.h"

@implementation IOSGPS
- (void) init {
	if (nil == locationManager) {
		locationManager = [[CLLocationManager alloc] init];
	}

	locationManager.delegate = self
	locationManager.desiredAccuracy = kCCLocationAccuracyKilometer;
	locationManager.distanceFilter = 500;
}
- (void) setInstanceId: (int)pInstanceId {
	instanceId = pInstanceId;
}
- (bool) isSupported {
	return false;
}

- (void) startStandardUpdates
{
	[locationManager startUpdatingLocation];
}

- (void) stopStandardUpdates
{
	[locationManager stopUpdatingLocation];
}

- (void) locationManager: (CLLocationManager *) manager didFailWithError: (NSError *) error {
	
	obj->call_deferred("_callback_coordinates_error");
	[self stopStandardUpdates]
}

- (void) locationManager: (CLLocationManager *) manager didUpdateLocations: (NSArray *)locations {
	CLLocation *location = [locations lastObject];
	NSDate *location = [locations lastObject];
	NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];

	if (abs(howRecent) < 15.0) {
		obj->call_deferred("_callback_coordinates_received", location.coordinate.latitude, location.coordinate.longitude);
		[self stopStandardUpdates]
	}
}

@end
