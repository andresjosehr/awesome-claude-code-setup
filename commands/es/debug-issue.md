# Depurar Problema

Por favor ayudame a depurar este problema: $ISSUE_DESCRIPTION

Error/sintoma: $ERROR_MESSAGE
Componente/area (si se conoce): ${COMPONENT:-desconocido}
Cuando comenzo: ${TIMEFRAME:-recientemente}
Issue de GitHub: ${ISSUE_NUMBER:-ninguno}
PR que causa el problema: ${PR_NUMBER:-desconocido}

## Flujo de Trabajo de Depuracion Sistematica

1. **Buscar patrones de error**:
   ```bash
   # Buscar el error exacto
   chs find-code "$ERROR_MESSAGE"

   # Buscar terminos relacionados
   chs find-code "${RELATED_TERMS:-error excepcion fallo}"
   ```

2. **Verificar cambios recientes**:
   ```bash
   # Obtener contexto de commits recientes
   ch ctx prepare-migration "depurar $ISSUE_DESCRIPTION"

   # Mostrar modificaciones recientes
   chg log --oneline -20
   ```

3. **Rastrear el area del problema**:
   ```bash
   # Enfocarse en area sospechosa
   ch ctx focus "${COMPONENT:-src}" 3

   # Encontrar archivos relacionados
   chs find-file "*${COMPONENT}*"
   ```

4. **Analizar flujo de codigo**:
   - Rastrear imports: `ch cr imports-of "$SUSPECTED_FILE"`
   - Encontrar dependencias: `ch cr imported-by "$SUSPECTED_FILE"`
   - Verificar dependencias circulares: `ch cr circular`

5. **Verificar cobertura de pruebas**:
   ```bash
   # Encontrar pruebas relacionadas
   chs find-file "*.test.*" | xargs grep -l "$COMPONENT"

   # Buscar fallos en pruebas
   ch ts test | grep -i "fail"
   ```

6. **Buscar problemas de calidad de codigo**:
   ```bash
   # Verificar TODOs y codigo de depuracion
   ch cq todos --with-context | grep -C3 "$COMPONENT"
   ch cq console-logs
   ```

7. **Verificar items relacionados en GitHub**:
   ```bash
   # Si se proporciono numero de issue, obtener detalles
   if [ -n "$ISSUE_NUMBER" ]; then
     gh issue view "$ISSUE_NUMBER"
   fi

   # Si se proporciono numero de PR, verificar cambios
   if [ -n "$PR_NUMBER" ]; then
     gh pr diff "$PR_NUMBER" | grep -C5 "$COMPONENT"
   fi

   # Buscar issues relacionados
   gh issue list --search "$ERROR_MESSAGE" --limit 5
   ```

8. **Generar reporte de depuracion**:
   - Resumir hallazgos
   - Identificar causa raiz
   - Proponer solucion
   - Notar efectos secundarios
   - Vincular a issue/PR si aplica

## Flujo de Trabajo de Correccion

Una vez identificada la causa raiz:

```bash
# Slugificar descripcion del issue usando funcion comun
source ~/.claude/scripts/common-functions.sh
ISSUE_SLUGIFIED=$(slugify "$ISSUE_DESCRIPTION" 50)

# Crear rama de correccion desde issue
git checkout -b "fix/${ISSUE_NUMBER:-bug}-${ISSUE_SLUGIFIED}"

# Despues de implementar la correccion
git add -A
git commit -m "fix: $ISSUE_DESCRIPTION (#$ISSUE_NUMBER)"
git push -u origin HEAD

# Crear PR vinculado al issue
gh pr create \
  --title "fix: $ISSUE_DESCRIPTION" \
  --body "## Descripcion\n\nCorrige $ERROR_MESSAGE\n\nCierra #$ISSUE_NUMBER\n\n## Causa Raiz\n\n[Explicacion]\n\n## Solucion\n\n[Que se cambio]\n\n## Pruebas\n\n- [ ] El error ya no ocurre\n- [ ] Sin regresiones\n- [ ] Pruebas agregadas"
```

## Lista de Verificacion de Depuracion

- [ ] Error reproducido localmente
- [ ] Causa raiz identificada
- [ ] Correccion implementada
- [ ] Pruebas agregadas/actualizadas
- [ ] No se introdujeron nuevos problemas
- [ ] Documentacion actualizada si es necesario
- [ ] Issue/PR actualizado con hallazgos

Por favor analiza el codigo base y ayudame a resolver este problema sistematicamente.
