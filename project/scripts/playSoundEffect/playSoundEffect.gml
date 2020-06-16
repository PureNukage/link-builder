///@param sound_index

var sound_index = argument[0]

audio_play_sound(sound_index,0,false)
audio_sound_gain(sound_index,soundSystem.current_sound_effect_volume,0)

debug_log("Playing sound effect: " + string(sound_index))