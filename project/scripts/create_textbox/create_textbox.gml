///@param text
///@param [icon]
///@param [timer]
///@param [uniqueID]

var text = argument[0]
if argument_count >= 2 var icon = argument[1] else var icon = -1
if argument_count >= 3 var timer = argument[2] else var timer = -1
if argument_count >= 4 var _uniqueID = argument[3] else var _uniqueID = -1

var buffer = buffer_create(1024,buffer_fixed,1)

buffer_seek(buffer,buffer_seek_start,0)

//	Pack data into our buffer
buffer_write(buffer,buffer_string,text)
buffer_write(buffer,buffer_s8,icon)
buffer_write(buffer,buffer_s8,timer)
buffer_write(buffer,buffer_s32,_uniqueID)

var buffer_encoded = buffer_base64_encode(buffer,0,buffer_tell(buffer))

ds_list_add(textboxController.message_queue,buffer_encoded)