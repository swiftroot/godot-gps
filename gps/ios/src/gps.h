/*
gps.h 
Copyright (c) 2019 Alek Mlynek, Swift Root Inc.

C++ class for connecting Godot and iOS GPS service
*/

#ifndef GPS_H
#define GPS_H

#include "core/reference.h"

#ifdef __OBJC__
@class IOSGPS;
typedef IOSGPS *iosGPSPointer;
#else
typedef void *iosGPSPointer;
#endif

class GPS : public Reference {
	GDCLASS(GPS, Reference);

	GPS *instance;
	IOSGPS iosGPS;

	protected:
		static void _bind_methods();
	public:
		void init(int instanceId);
		bool is_supported();

		GPS();
		// ~DeviceCheck();
};
#endif
