# General Software Inc - Lista de Deseos

Aplicación demostrativa para General Software Inc.

Lista de Deseos colaborativa.

## Detalles de uso

La aplicación muestra tres tipos de usuarios

- Project Manager
- Group Manager
- Member

Al iniciar se puede seleccionar el tipo de usuario con el que se va a trabajar.

El Rol `Project Manager` puede crear `Deseos`, así como asignarlos, iniciarlos y terminarlos.

El Rol `Group Manager` puede asignar `Deseos`, iniciarlos y termiarlos.

El Rol `Member` solo ve los `Deseos` que le han asignado, puede iniarlos y termiarlos.

Los Deseos solo se pueden asignar al Rol `Member`.

Los Deseos, una vez terminados no se pueden modificar más.

## Datos de prueba

La aplicación cuenta con unos datos de prueba que pueden activarse en descomentando las lineas 16 y 17 en [app_bloc.dart](https://github.com/leolopez89/gsi_wishes/blob/master/lib/bloc/app/app_bloc.dart#L16-L17)

## Comentarios

Los comentarios del código se pueden ver en la rama [comentarios](https://github.com/leolopez89/gsi_wishes/tree/comments)
