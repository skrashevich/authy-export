#!/bin/bash

# Create a "bin" directory if it doesn't exist
mkdir -p bin

# List of target operating systems
OS_TARGETS=("windows" "linux" "darwin")

# Loop through each OS target
for OS in "${OS_TARGETS[@]}"
do
    # Set the GOOS environment variable for the current target OS
    export GOOS="$OS"
    BINARY_NAME="authy-export"

    # Add .exe extension for Windows
    if [ "$OS" == "windows" ]; then
        BINARY_NAME="authy-export.exe"
    fi

        # Add .exe extension for Windows
    if [ "$OS" == "darwin" ]; then
        BINARY_NAME="authy-export-mac"
    fi
    # make bin directory if it doesn't exist
    mkdir -p bin

    # Build the binary and place it in the "bin" directory
    go build -o "bin/$BINARY_NAME" cmd/authy-export/authy-export.go

    # Print a message indicating the build is complete for the current OS
    echo "Built for $OS as bin/$BINARY_NAME"
done

# Clean up any environment variables
unset GOOS

# Print a message indicating the build process is complete
echo "Build process completed for all platforms. Binaries are in the 'bin' directory."
