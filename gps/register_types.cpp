#include "register_types.h"
#include <core/class_db.h>
#include <core/engine.h>

void register_gps_types() {
	//  ClassDB is not a good idea in this case. If it doesn't exist, there is no way to check.
	//	ClassDB::register_class<DeviceCheck>();
	
	Engine::get_singleton()->add_singleton(Engine::Singleton("GPS", memnew(GPS)));

}

void unregister_gps_types() {
}
