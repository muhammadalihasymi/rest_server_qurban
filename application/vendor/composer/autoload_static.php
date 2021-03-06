<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit7050723697860670dddde3108efcabe8
{
    public static $prefixLengthsPsr4 = array (
        'c' => 
        array (
            'chriskacerguis\\RestServer\\' => 26,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'chriskacerguis\\RestServer\\' => 
        array (
            0 => __DIR__ . '/..' . '/chriskacerguis/codeigniter-restserver/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit7050723697860670dddde3108efcabe8::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit7050723697860670dddde3108efcabe8::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit7050723697860670dddde3108efcabe8::$classMap;

        }, null, ClassLoader::class);
    }
}
