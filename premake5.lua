project "glfw3"
    kind "StaticLib"
    language "C"
    cdialect "C99"

    targetdir ("build/" .. outputdir .. "/bin")
    objdir ("build/" .. outputdir .. "/obj/%{prj.name}")

    files
    {
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c"
    }

    includedirs
    {
        "include"
    }

    filter "system:linux"
        files
        {
            'src/posix_module.c',
            'src/posix_time.c',
            'src/posix_thread.c',
            'src/x11_init.c',
            'src/x11_monitor.c',
            'src/x11_window.c',
            'src/xkb_unicode.c',
            "src/glx_context.c",
            'src/linux_joystick.c'
        }

        defines
        {
            "_GLFW_X11",
            "_POSIX_C_SOURCE=199309L",
        }

    filter "system:windows"
        files
        {
            "src/win32_module.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_window.c",
            "src/wgl_context.c"
        }

        defines 
        { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }
        
    filter "configurations:Debug"
        symbols "On"
        optimize "Debug"

    filter "configurations:Release"
        symbols "On"
        optimize "Speed"

    filter "configurations:Dist"
        symbols "Off"
        optimize "Full"
