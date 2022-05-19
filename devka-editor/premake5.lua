project "devka-editor"
    kind "ConsoleApp"
    language "c++"
    cppdialect "c++20"
    staticruntime "off"

    targetdir("%{wks.location}/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/" .. outputdir .. "/.int/%{prj.name}")

    includedirs {
        "src",
        "%{IncludeDirs.spdlog}",
        "%{IncludeDirs.common}",
        "%{IncludeDirs.physics}",
        "%{IncludeDirs.GLFW}",
        "%{IncludeDirs.imgui}",
        "%{IncludeDirs.graphic}",
        "%{IncludeDirs.core}",
    }

    files {
        "src/**.hpp",
        "src/**.cpp",
    }

    links {
        "common",
        "GLFW",
        "imgui",
        "devka-physics",
        "devka-graphic",
        "devka-core",
    }


    filter "system:linux"
        systemversion "latest"
        defines{}

        filter "configurations:Debug"
        defines "DK_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "DK_RELEASE"
        runtime "Release"
        optimize "on"


