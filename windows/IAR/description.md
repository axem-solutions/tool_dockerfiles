1. Install the IAR toolchain on your native system.
2. Copy only the common and {targer architecture} (e.g. arm) directories to the Docker context folder.
3. Download the Visual C++ Redistibutable installer to the context folder.
2. Run "docker build -t iar ." in the context folder.
