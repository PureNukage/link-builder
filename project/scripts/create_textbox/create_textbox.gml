///@param text
///@param [icon]
///@param [timer]
///@param [uniqueID]
///@param [event_type]
///@param [object_id]
///@param [dialogue]

var text = argument[0]
if argument_count >= 2 var icon = argument[1] else var icon = -1
if argument_count >= 3 var timer = argument[2] else var timer = -1
if argument_count >= 4 var _uniqueID = argument[3] else var _uniqueID = -1
if argument_count >= 5 var Event_type = argument[4] else var Event_type = -1
if argument_count >= 6 var Object_id = argument[5] else var Object_id = -1
if argument_count >= 7 var Dialogue = argument[6] else var Dialogue = -1

var buffer = buffer_create(1024,buffer_fixed,1)

buffer_seek(buffer,buffer_seek_start,0)

//	Pack data into our buffer
buffer_write(buffer,buffer_string,text)
buffer_write(buffer,buffer_s8,icon)
buffer_write(buffer,buffer_s8,timer)
buffer_write(buffer,buffer_s32,_uniqueID)
buffer_write(buffer,buffer_s8,Event_type)
buffer_write(buffer,buffer_s32,Object_id)
buffer_write(buffer,buffer_s8,Dialogue)

var buffer_encoded = buffer_base64_encode(buffer,0,buffer_tell(buffer))

ds_list_add(textboxController.message_queue,buffer_encoded)