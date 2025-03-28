import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'miniaudio',
        archs: ['x64'],
        variables: [],
        copy: {
            'miniaudio/miniaudio.h': 'miniaudio/miniaudio.c'
        },
        defines: ['MINIAUDIO_IMPLEMENTATION'],
        options: [],
        subdirectories: [],
        libraries: {
            'miniaudio': {
                sources: ['miniaudio/miniaudio.c']
            }
        },
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;