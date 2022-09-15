# The IAR requires the Visual C++ Redistributable, which is not part of the
# windows base image. Place the installer in the image context root dir.

FROM mcr.microsoft.com/windows:20H2
ADD . C:/
RUN c:\\vc_redist.x64.exe /quiet /install
WORKDIR c:\\dev_project
