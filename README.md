# manifest
easiest manifest embedding as internal-resource: contains mt.exe + generic manifest + drag&amp;drop batch. drag and drop any amount of exe/sfx/dll/etc... on to the batch file, it will quickly add (or replace the existing manifest) with the generic one, mt.exe is part of Windows-SDK and will correctly write the manifest as a resource. Tools such as ResHacker can work too but I had some file corrupted when using it, so I've reverted to using official manifest tool.