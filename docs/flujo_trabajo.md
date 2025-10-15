# Flujo de Trabajo con Git y GitHub

Este proyecto utiliza un flujo de trabajo basado en ramas para asegurar la colaboración ordenada y el control de versiones.

## Ramas

- **main**: Rama principal del proyecto. Solo recibe código estable.
- **dev**: Rama de desarrollo. Aquí se integran las nuevas funcionalidades.
- **testing**: Rama para hacer pruebas antes de pasar a dev.

## Flujo de trabajo

1. Se trabaja en `testing`
2. Se hace merge a `dev`
3. Se revisa y valida
4. Se hace Pull Request de `dev` a `main`

## Pull Requests

Todo cambio hacia `main` debe pasar por un PR desde `dev` y ser aprobado.
