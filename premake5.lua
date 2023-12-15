-- OUT_DIR and INT_DIR must be defined in the top-most premake file before including this file

project "podofo"
	kind "StaticLib"
	language "C++"

	debugdir (OUT_DIR)
	targetdir (OUT_DIR)
	objdir (INT_DIR)

	files
	{
		"src/podofo/**.h",
		"src/podofo/**.hpp",
		"src/podofo/**.cpp",

		"tools/podofopages/**.h",
		"tools/podofopages/**.cpp",
		"tools/podofosign/**.cpp",

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

	defines
	{
		"PODOFO_STATIC",
		"PODOFO_HAVE_JPEG_LIB",
		"PODOFO_HAVE_PNG_LIB",
		"PODOFO_HAVE_TIFF_LIB",
		"PODOFO_HAVE_FONTCONFIG",
		"PODOFO_HAVE_LIBIDN"
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

		libdirs
		{
			"extern/deps/3rdparty/fontconfig/lib/Win64",
			"extern/deps/3rdparty/freetype/lib/Win64",
			"extern/deps/3rdparty/libidn/lib/Win64",
			"extern/deps/3rdparty/libjpeg/lib/Win64",
			"extern/deps/3rdparty/libpng/lib/Win64",
			"extern/deps/3rdparty/libtiff/lib/Win64",
			"extern/deps/3rdparty/libxml2/lib/Win64",
			"extern/deps/3rdparty/openssl/lib/Win64",
			"extern/deps/3rdparty/openssl/lib/Win64",
			"extern/deps/3rdparty/zlib/lib/Win64"
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

		links
		{
			"extern/deps/3rdparty/fontconfig/lib/Win64/fontconfigd.lib",
			"extern/deps/3rdparty/freetype/lib/Win64/freetyped.lib",
			"extern/deps/3rdparty/libidn/lib/Win64/idnd.lib",
			"extern/deps/3rdparty/libjpeg/lib/Win64/jpegd.lib",
			"extern/deps/3rdparty/libpng/lib/Win64/pngd.lib",
			"extern/deps/3rdparty/libtiff/lib/Win64/tiffd.lib",
			"extern/deps/3rdparty/libxml2/lib/Win64/libxml2d.lib",
			"extern/deps/3rdparty/openssl/lib/Win64/cryptod.lib",
			"extern/deps/3rdparty/openssl/lib/Win64/ssld.lib",
			"extern/deps/3rdparty/zlib/lib/Win64/zlibd.lib"
		}

	filter "configurations:not Debug"
		runtime "Release"
		symbols "Off"
		optimize "Full"

		links
		{
			"extern/deps/3rdparty/fontconfig/lib/Win64/fontconfig.lib",
			"extern/deps/3rdparty/freetype/lib/Win64/freetype.lib",
			"extern/deps/3rdparty/libidn/lib/Win64/idn.lib",
			"extern/deps/3rdparty/libjpeg/lib/Win64/jpeg.lib",
			"extern/deps/3rdparty/libpng/lib/Win64/png.lib",
			"extern/deps/3rdparty/libtiff/lib/Win64/tiff.lib",
			"extern/deps/3rdparty/libxml2/lib/Win64/libxml2.lib",
			"extern/deps/3rdparty/openssl/lib/Win64/crypto.lib",
			"extern/deps/3rdparty/openssl/lib/Win64/ssl.lib",
			"extern/deps/3rdparty/zlib/lib/Win64/zlib.lib"
		}
