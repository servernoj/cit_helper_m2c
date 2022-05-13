## Converter of a movie clip into collage of stop frames

### Usage:

```
./m2c.sh <movie clip> [width height]
```
where
- `<movie clip>` is the filename of a video clip to be converted
- `width` (defaults to 4) is an optional parameter affecting the number of tiles along the **horizontal** dimension in the resulting collage
- `height` (defaults to 3) is an optional parameter affecting the number of tiles along the **vertical** dimension

The resulting collage will be saved into a file named after original clip with `.jpg` extension.

### Configuration

The script has a number of dependencies that have to be installed ahead of time
- `bash` being the default shell.
- `ffmpeg` utility needs to be installed and its full installation path has to be set in `m2c.sh` script.
- `awk` path needs to be specified in `m2c.sh` script
- `ImageMagick` utility has to be installed and installation path to one of its binaries, i.e. `montage` has to be specified in `m2c.sh` script

**Notes**:

1. The paths to binary files have to be explicitly set to allow execution of the script via automation flow, e.g. in Automator Workflow on MacOS.

1. Execution time would be proportional to the video clip length
