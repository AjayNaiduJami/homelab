# 🖨️ 3D Printing with OctoPrint

## Printer
- **Model**: Creality K1C
- **Connected via**: USB to ThinkCentre M920q

## Software
- **Container**: `octoprint`
- **Interface**: Web-based UI with plugin support
- **Features**:
  - Live print monitoring
  - Uploading G-code via network
  - Webcam integration (optional)
  - Plugin ecosystem for custom features

## Notes
- Ensure `/dev/ttyUSB0` or equivalent is passed into the container.
- USB passthrough permissions may be needed depending on your OS config.
