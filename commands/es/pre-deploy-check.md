# Lista de Verificacion Pre-Despliegue

Por favor, ayudame a asegurar que estamos listos para desplegar a ${ENVIRONMENT:-produccion}.

Tipo de despliegue: ${DEPLOY_TYPE:-estandar}
Rama destino: ${TARGET_BRANCH:-main}
Omitir verificaciones: ${SKIP_CHECKS:-ninguna}

## Verificaciones Criticas

1. **Eliminar codigo de depuracion**:
   ```bash
   # Verificar console logs
   ch cq console-logs

   # Encontrar flags de depuracion
   chs find-code "DEBUG|debug.*=.*true|__DEV__"

   # Verificar URLs de desarrollo
   chs find-code "localhost|127\\.0\\.0\\.1|192\\.168\\."
   ```

2. **Configuracion del entorno**:
   ```bash
   # Encontrar variables de entorno
   chs find-code "process\\.env\\.|ENV\\[|getenv\\("

   # Verificar valores por defecto faltantes
   chs find-code "process\\.env\\.\\w+" 2>/dev/null | while IFS= read -r match; do
     echo "$match" | grep -q "||" || echo "Valor por defecto faltante: $match"
   done

   # Verificar que .env.example esta actualizado
   diff .env .env.example 2>/dev/null || echo "Verificar archivos .env"
   ```

3. **Escaneo de seguridad**:
   ```bash
   # Verificacion final de secretos
   ch cq secrets-scan

   # Verificar permisos de archivos
   find . -type f -name "*.${SCRIPT_EXT:-sh|py}" -exec ls -la {} \; | grep -v "r--"

   # Verificar que no hay archivos sensibles
   chs find-file "*.pem|*.key|*.env|*.secret"
   ```

4. **Verificacion de compilacion**:
   ```bash
   # Compilacion limpia
   # Eliminar artefactos de compilacion (ajustar rutas para tu proyecto)
   # Ejemplos: dist/, build/, target/, out/, _site/

   # Ejecutar comando de compilacion de tu proyecto
   # Ejemplos: npm run build, make build, gradle build, etc.

   # Verificar que no hay source maps o archivos de depuracion en produccion
   # Verificar tu directorio de salida por archivos .map o simbolos de depuracion
   ```

5. **Suite de pruebas**:
   ```bash
   # Ejecutar suite de pruebas de tu proyecto
   # Ejemplos: npm test, pytest, go test, mvn test, etc.

   # Ejecutar pruebas E2E/integracion si estan disponibles

   # Verificar cobertura de pruebas si esta configurada
   ```

6. **Verificaciones de base de datos**:
   ```bash
   # Encontrar archivos de migracion
   chs find-file "*migration*|*migrate*" --sort-date | tail -5

   # Verificar conflictos de migracion
   git diff "${TARGET_BRANCH:-main}" --name-only | grep -i migration

   # Buscar cambios de esquema
   chs find-code "CREATE TABLE|ALTER TABLE|DROP TABLE"
   ```

7. **Verificaciones de rendimiento**:
   ```bash
   # Verificar tamano de compilacion (si aplica)
   # Buscar archivos inesperadamente grandes en tu salida de compilacion

   # Encontrar assets grandes en tu directorio de compilacion
   # Ajustar la ruta para coincidir con tu ubicacion de salida de compilacion

   # Verificar imagenes no optimizadas
   find . -name "*.png" -o -name "*.jpg" -size "+${IMG_SIZE:-500k}"
   ```

8. **Documentacion**:
   ```bash
   # Verificar si README esta actualizado
   git diff ${TARGET_BRANCH:-main} README.md

   # Verificar docs de API si aplica
   chs find-file "*api*.md|*API*.md"

   # Verificar changelog
   git log --oneline ${TARGET_BRANCH:-main}..HEAD > PENDING_CHANGES.txt
   ```

## Preparacion para Despliegue

### Verificaciones de version:
- [ ] Version incrementada apropiadamente
- [ ] Changelog actualizado
- [ ] Tags creados si es necesario

### Infraestructura:
- [ ] Migraciones de base de datos listas
- [ ] Variables de entorno configuradas
- [ ] Cache de CDN limpiado si es necesario
- [ ] Alertas de monitoreo configuradas

### Plan de rollback:
- [ ] Version anterior etiquetada
- [ ] Script de rollback probado
- [ ] Plan de rollback de base de datos
- [ ] Feature flags listos

## Verificacion Final

```bash
# Generar resumen de despliegue
echo "=== Resumen de Despliegue ==="
echo "Entorno: ${ENVIRONMENT:-produccion}"
echo "Rama: $(git branch --show-current)"
echo "Commit: $(git rev-parse --short HEAD)"
echo "Cambios: $(git rev-list --count ${TARGET_BRANCH:-main}..HEAD) commits"
echo ""
echo "Archivos cambiados:"
git diff --stat ${TARGET_BRANCH:-main}
```

## Lista Post-Despliegue

- [ ] Pruebas de humo pasan
- [ ] Monitoreo muestra metricas normales
- [ ] Sin picos de errores en logs
- [ ] Funcionalidades clave verificadas
- [ ] Metricas de rendimiento normales

Por favor verifica que todas las verificaciones pasen y proporciona una recomendacion de despliegue.
