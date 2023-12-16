-- OUT_DIR and INT_DIR must be defined in the top-most premake file before including this file

project "podofo"
	kind "SharedLib"
	language "C++"

	debugdir (OUT_DIR)
	targetdir (OUT_DIR)
	objdir (INT_DIR)

	files
	{
		"src/podofo/**.h",
		"src/podofo/**.hpp",
		"src/podofo/**.cpp",

		"3rdparty/**.h",
		"3rdparty/**.hpp",
		"3rdparty/**.cpp"
	}

	includedirs
	{
		"src",
		"src/podofo",
		"tools",
		"3rdparty",

		"extern/deps/3rdparty",
		"extern/deps/3rdparty/bzip2/include",
		"extern/deps/3rdparty/fontconfig/include",
		"extern/deps/3rdparty/freetype/include/freetype2",
		"extern/deps/3rdparty/libidn/include",
		"extern/deps/3rdparty/libjpeg/include",
		"extern/deps/3rdparty/libpng/include",
		"extern/deps/3rdparty/libtiff/include",
		"extern/deps/3rdparty/libuuid/include",
		"extern/deps/3rdparty/libxml2/include",
		"extern/deps/3rdparty/openssl/include",
		"extern/deps/3rdparty/zlib/include"
	}

	libdirs
	{
		"%{OUT_DIR}/lib/podofo"
	}

	links
	{
		"kernel32",
		"user32",
		"gdi32",
		"winspool",
		"comdlg32",
		"advapi32",
		"shell32",
		"ole32",
		"oleaut32",
		"uuid",
		"ws2_32",
		"Crypt32"
	}

	defines
	{
		"PODOFO_SHARED",
		"PODOFO_BUILD",
		"PODOFO_HAVE_JPEG_LIB",
		"PODOFO_HAVE_PNG_LIB",
		"PODOFO_HAVE_TIFF_LIB",
		"PODOFO_HAVE_FONTCONFIG"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

		files
		{
			"extern/deps/3rdparty/fontconfig/**.h",
			"extern/deps/3rdparty/freetype/**.h",
			"extern/deps/3rdparty/libidn/**.h",
			"extern/deps/3rdparty/libjpeg/**.h",
			"extern/deps/3rdparty/libpng/**.h",
			"extern/deps/3rdparty/libtiff/**.h",
			"extern/deps/3rdparty/libxml2/**.h",
			"extern/deps/3rdparty/openssl/include/openssl/*.h",
			"extern/deps/3rdparty/openssl/include/openssl/Win64/*.h",
			"extern/deps/3rdparty/zlib/**.h"
		}

		defines
		{
			"PODOFO_HAVE_WIN32GDI"
		}

		buildoptions
		{
			"/Zc:__cplusplus"
		}

	filter "system:linux"
		systemversion "latest"
		cppdialect "gnu++17"

		files
		{
			"extern/deps/3rdparty/bzip2/**.h",
			"extern/deps/3rdparty/fontconfig/**.h",
			"extern/deps/3rdparty/freetype/**.h",
			"extern/deps/3rdparty/libidn/**.h",
			"extern/deps/3rdparty/libjpeg/**.h",
			"extern/deps/3rdparty/libpng/**.h",
			"extern/deps/3rdparty/libtiff/**.h",
			"extern/deps/3rdparty/libuuid/**.h",
			"extern/deps/3rdparty/libxml2/**.h",
			"extern/deps/3rdparty/openssl/include/openssl/*.h",
			"extern/deps/3rdparty/openssl/include/openssl/linux-x86_64/*.h",
			"extern/deps/3rdparty/zlib/**.h"
		}

	filter "system:macosx"
		systemversion "latest"
		cppdialect "gnu++17"

		files
		{
			"extern/deps/3rdparty/bzip2/**.h",
			"extern/deps/3rdparty/fontconfig/**.h",
			"extern/deps/3rdparty/freetype/**.h",
			"extern/deps/3rdparty/libidn/**.h",
			"extern/deps/3rdparty/libjpeg/**.h",
			"extern/deps/3rdparty/libpng/**.h",
			"extern/deps/3rdparty/libtiff/**.h",
			"extern/deps/3rdparty/libuuid/**.h",
			"extern/deps/3rdparty/libxml2/**.h",
			"extern/deps/3rdparty/openssl/include/openssl/*.h",
			"extern/deps/3rdparty/openssl/include/openssl/linux-macosx-x86_64/*.h",
			"extern/deps/3rdparty/zlib/**.h"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "Full"

		prebuildcommands
		{
			'{RMDIR} "%{OUT_DIR}/lib/podofo"',
			'{MKDIR} "%{OUT_DIR}/lib/podofo"',

			'{COPYFILE} "extern/deps/3rdparty/fontconfig/lib/Win64/fontconfigd.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/freetype/lib/Win64/freetyped.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libidn/lib/Win64/idnd.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libjpeg/lib/Win64/jpegd.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libpng/lib/Win64/pngd.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libtiff/lib/Win64/tiffd.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libxml2/lib/Win64/libxml2d.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/openssl/lib/Win64/cryptod.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/openssl/lib/Win64/ssld.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/zlib/lib/Win64/zlibd.lib" "%{OUT_DIR}/lib/podofo"'
		}

		links
		{
			"%{OUT_DIR}/lib/podofo/fontconfigd.lib",
			"%{OUT_DIR}/lib/podofo/freetyped.lib",
			"%{OUT_DIR}/lib/podofo/idnd.lib",
			"%{OUT_DIR}/lib/podofo/jpegd.lib",
			"%{OUT_DIR}/lib/podofo/pngd.lib",
			"%{OUT_DIR}/lib/podofo/tiffd.lib",
			"%{OUT_DIR}/lib/podofo/libxml2d.lib",
			"%{OUT_DIR}/lib/podofo/cryptod.lib",
			"%{OUT_DIR}/lib/podofo/ssld.lib",
			"%{OUT_DIR}/lib/podofo/zlibd.lib"
		}

	filter "configurations:not Debug"
		runtime "Release"
		symbols "Off"
		optimize "Full"

		prebuildcommands
		{
			'{RMDIR} "%{OUT_DIR}/lib/podofo"',
			'{MKDIR} "%{OUT_DIR}/lib/podofo"',

			'{COPYFILE} "extern/deps/3rdparty/fontconfig/lib/Win64/fontconfig.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/freetype/lib/Win64/freetype.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libidn/lib/Win64/idn.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libjpeg/lib/Win64/jpeg.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libpng/lib/Win64/png.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libtiff/lib/Win64/tiff.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/libxml2/lib/Win64/libxml2.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/openssl/lib/Win64/crypto.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/openssl/lib/Win64/ssl.lib" "%{OUT_DIR}/lib/podofo"',
			'{COPYFILE} "extern/deps/3rdparty/zlib/lib/Win64/zlib.lib" "%{OUT_DIR}/lib/podofo"'
		}

		links
		{
			"%{OUT_DIR}/lib/podofo/fontconfig.lib",
			"%{OUT_DIR}/lib/podofo/freetype.lib",
			"%{OUT_DIR}/lib/podofo/idn.lib",
			"%{OUT_DIR}/lib/podofo/jpeg.lib",
			"%{OUT_DIR}/lib/podofo/png.lib",
			"%{OUT_DIR}/lib/podofo/tiff.lib",
			"%{OUT_DIR}/lib/podofo/libxml2.lib",
			"%{OUT_DIR}/lib/podofo/crypto.lib",
			"%{OUT_DIR}/lib/podofo/ssl.lib",
			"%{OUT_DIR}/lib/podofo/zlib.lib"
		}
