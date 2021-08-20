# General Software Inc - Lista de Deseos

Aplicación demostrativa para General Software Inc.

Lista de Deseos colaborativa.

## Detalles de uso

La aplicación muestra tres tipos de usuarios

- Project Manager (PM)
- Group Manager (GM)
- Miembro (M)

Al iniciar se puede seleccionar el tipo de usuario con el que se va a trabajar.

El Rol `PM` puede crear `Deseos`, así como asignarlos, iniciarlos y terminarlos.

El Rol `GM` puede asignar `Deseos`, iniciarlos y termiarlos.

El Rol `M` solo ve los `Deseos` que le han asignado, puede iniarlos y termiarlos.

Los roles una vez terminados no se pueden modificar más.

## Datos de prueba

La aplicación cuenta con unos datos de prueba que pueden activarse en descomentando las lineas 11 y 17 en [app_bloc.dart](https://github.com/leolopez89/gsi_wishes/blob/master/lib/bloc/app/app_bloc.dart#L16-L17)
