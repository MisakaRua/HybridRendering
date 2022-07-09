.\tools\shaderc.exe -f .\hybrid_rendering\shaders\src\cubes\vs_cubes.sc -i .\hybrid_rendering\shaders\include\ -o .\hybrid_rendering\shaders\bin\dx11\vs_cubes.bin --type vertex -p vs_5_0 --varyingdef .\hybrid_rendering\shaders\src\cubes\varying.def.sc

.\tools\shaderc.exe -f .\hybrid_rendering\shaders\src\cubes\fs_cubes.sc -i .\hybrid_rendering\shaders\include\ -o .\hybrid_rendering\shaders\bin\dx11\fs_cubes.bin --type fragment -p ps_5_0 --varyingdef .\hybrid_rendering\shaders\src\cubes\varying.def.sc

.\tools\shaderc.exe -f .\hybrid_rendering\shaders\src\cubes\vs_cubes.sc -i .\hybrid_rendering\shaders\include\ -o .\hybrid_rendering\shaders\bin\dx9\vs_cubes.bin --type vertex -p vs_3_0 --varyingdef .\hybrid_rendering\shaders\src\cubes\varying.def.sc

.\tools\shaderc.exe -f .\hybrid_rendering\shaders\src\cubes\fs_cubes.sc -i .\hybrid_rendering\shaders\include\ -o .\hybrid_rendering\shaders\bin\dx9\fs_cubes.bin --type fragment -p ps_3_0 --varyingdef .\hybrid_rendering\shaders\src\cubes\varying.def.sc