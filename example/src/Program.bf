using System;

using static miniaudio.miniaudio;

namespace example;

class Program
{
	public static void data_callback(ma_device* pDevice, void* pOutput, void* pInput, ma_uint32 frameCount)
	{
		// In playback mode copy data to pOutput. In capture mode read data from pInput. In full-duplex mode, both
		// pOutput and pInput will be valid and you can move data from pInput into pOutput. Never process more than
		// frameCount frames.
	}

	public static int Main(String[] args)
	{
		ma_device_config config = ma_device_config_init(.ma_device_type_playback);
		config.playback.format   = .ma_format_f32; // Set to ma_format_unknown to use the device's native format.
		config.playback.channels = 2; // Set to 0 to use the device's native channel count.
		config.sampleRate        = 48000; // Set to 0 to use the device's native sample rate.
		//config.dataCallback      = (p, o, i, f) => Program.data_callback; // This function will be called when miniaudio needs more data.
		//config.pUserData         = pMyCustomData; // Can be accessed from the device object (device.pUserData).

		ma_engine engine;

		ma_engine_init(null, &engine);

		ma_engine_play_sound(&engine, "sound.wav", null);

		Console.WriteLine("Press a key to toggle volume...");

		while (Console.Read() case .Ok(let val))
		{
			let vol = ma_engine_get_volume(&engine);

			ma_engine_set_volume(&engine, vol == 1 ? 0.2f : 1);
		}

		ma_engine_uninit(&engine);

		return 0;
	}
}