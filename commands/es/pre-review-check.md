# Lista de Verificacion Pre-Revision

Por favor ayudame a asegurar que mi codigo esta listo para revision.

PR/Rama: ${PR_BRANCH:-rama actual}
Areas de enfoque: ${FOCUS_AREAS:-todos los cambios}

## Verificaciones de Calidad

1. **Encontrar y corregir codigo de depuracion**:
   ```bash
   # Encontrar TODOs que necesitan atencion
   ch cq todos --with-context

   # Eliminar logs de depuracion
   ch cq console-logs

   # Verificar codigo comentado
   chs find-code "^\\s*//.*\\b(console|debug|test)"
   ```

2. **Verificar metricas de calidad de codigo**:
   ```bash
   # Encontrar archivos demasiado grandes
   ch cq large-files ${MAX_LINES:-500}

   # Verificar complejidad
   ch cq complexity ${MAX_COMPLEXITY:-10}

   # Buscar patrones de codigo duplicado
   chs find-code "$PATTERN" --count
   ```

3. **Escaneo de seguridad**:
   ```bash
   # Escanear secretos hardcodeados
   ch cq secrets-scan

   # Verificar datos sensibles en logs
   chs find-code "password|token|secret|key" --exclude .env
   ```

4. **Verificar cobertura de pruebas**:
   ```bash
   # Encontrar archivos sin pruebas
   if ! git diff --name-only origin/main...HEAD 2>/dev/null | while IFS= read -r f; do
     echo "Verificando pruebas para: $f"
     chs find-file "*.test.*" | xargs grep -l "$(basename "$f" .js)" 2>/dev/null || echo "  No se encontraron pruebas para $f"
   done; then
     echo "Nota: No se pudo comparar con origin/main"
   fi

   # Ejecutar pruebas
   ch ts test
   ```

5. **Verificar dependencias**:
   ```bash
   # Auditar vulnerabilidades
   ch ts audit

   # Verificar dependencias no utilizadas
   ch ts deps --check-unused
   ```

6. **Verificacion de documentacion**:
   - Estan documentadas las nuevas funciones?
   - Esta actualizado el README si es necesario?
   - Estan anotados los cambios que rompen compatibilidad?

## Preparacion del PR

1. **Generar contexto para revisores**:
   ```bash
   # Crear resumen
   ch ctx summarize > PR_CONTEXT.md

   # Mostrar que cambio
   git diff --stat origin/main...HEAD
   ```

2. **Verificar historial de commits**:
   ```bash
   # Revisar commits
   git log --oneline origin/main..HEAD

   # Considerar squash si es necesario
   ```

3. **Actualizar PR si existe**:
   ```bash
   # Verificar si existe PR
   PR_NUMBER=$(gh pr list --head "$(git branch --show-current)" --json number -q ".[0].number")

   if [ -n "$PR_NUMBER" ]; then
     # Actualizar descripcion del PR con contexto
     gh pr edit "$PR_NUMBER" --body "$(gh pr view "$PR_NUMBER" --json body -q .body)\n\n## Contexto de Revision\n\n$(cat PR_CONTEXT.md)"

     # Marcar como listo si es borrador
     gh pr ready "$PR_NUMBER" 2>/dev/null || echo "PR ya listo para revision"

     # Agregar solicitud de revision si es necesario
     gh pr edit "$PR_NUMBER" --add-reviewer "${REVIEWER:-@me}"
   else
     echo "No se encontro PR. Crear uno con: gh pr create"
   fi
   ```

## Lista de Verificacion Final

- [ ] Todo el codigo de depuracion eliminado
- [ ] Sin secretos hardcodeados
- [ ] Las pruebas pasan localmente
- [ ] El nuevo codigo tiene pruebas
- [ ] Documentacion actualizada
- [ ] Sin archivos generados en el commit
- [ ] Los mensajes de commit son claros
- [ ] La descripcion del PR esta completa

Por favor revisa mis cambios y confirma que cumplen con los estandares de calidad.
