cmake -B build -G "Visual Studio 15 2017" -A x64 
.\CompileShaders.bat
Copy-Item -Path .\hybrid_rendering\shaders\bin\dx11 -Destination .\build\shaders\ -Recurse 