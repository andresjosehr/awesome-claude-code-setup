# Iniciar Nueva Funcionalidad

Por favor ayudame a comenzar a trabajar en una nueva funcionalidad: $FEATURE_NAME

Issue relacionado: ${ISSUE_NUMBER:-crear nuevo}
Tipo de funcionalidad: ${FEATURE_TYPE:-mejora}

## Flujo de Trabajo

1. **Crear o vincular issue de GitHub** (si no se proporciona):
   ```bash
   # Si no se proporciono numero de issue, crear uno
   if [ -z "$ISSUE_NUMBER" ]; then
     gh issue create \
       --title "$FEATURE_NAME" \
       --body "Implementacion de funcionalidad para: $FEATURE_NAME\n\n## Descripcion\n$FEATURE_DESCRIPTION\n\n## Criterios de Aceptacion\n- [ ] Por definir\n\n## Notas Tecnicas\n- Por definir" \
       --label "${FEATURE_TYPE:-enhancement}"
   fi

   # Listar issues recientes para verificar
   gh issue list --limit 5
   ```

2. **Generar contexto enfocado** para la funcionalidad:
   ```bash
   ch ctx for-task "$FEATURE_NAME"
   ```

3. **Entender estado actual del proyecto**:
   ```bash
   chp  # Vista general del proyecto
   chg status  # Estado de Git
   ```

4. **Crear rama de funcionalidad** (vinculada al issue):
   ```bash
   # Slugificar nombre de funcionalidad usando funcion comun
   source ~/.claude/scripts/common-functions.sh
   FEATURE_NAME_SLUGIFIED=$(slugify "$FEATURE_NAME")

   # Nombre de rama incluye numero de issue para vinculacion automatica
   BRANCH_NAME="feature/${ISSUE_NUMBER}-${FEATURE_NAME_SLUGIFIED}"
   git checkout -b "$BRANCH_NAME"

   # Push al remoto para establecer seguimiento
   git push -u origin "$BRANCH_NAME"
   ```

5. **Identificar areas afectadas**:
   - Buscar codigo relacionado: `chs find-code "$SEARCH_TERMS"`
   - Encontrar archivos relacionados: `chs find-file "*$RELATED_PATTERN*"`
   - Verificar imports: `ch cr imports-of "$MAIN_FILE"` (si aplica)

6. **Configurar estructura inicial**:
   - Identificar donde debe vivir la funcionalidad
   - Verificar patrones existentes en funcionalidades similares
   - Crear directorios necesarios

7. **Crear commit inicial y PR en borrador**:
   ```bash
   # Crear commit inicial
   echo "# $FEATURE_NAME\n\nImplementacion para #$ISSUE_NUMBER\n\n## PENDIENTE\n- [ ] Implementacion\n- [ ] Pruebas\n- [ ] Documentacion" > FEATURE_PLAN.md
   git add FEATURE_PLAN.md
   git commit -m "feat: Configuracion inicial para $FEATURE_NAME (#$ISSUE_NUMBER)"
   git push

   # Crear PR en borrador vinculado al issue
   gh pr create --draft \
     --title "feat: $FEATURE_NAME" \
     --body "## Descripcion\n\nImplementa $FEATURE_NAME\n\nCierra #$ISSUE_NUMBER\n\n## Cambios\n- Por definir\n\n## Pruebas\n- [ ] Pruebas unitarias\n- [ ] Pruebas de integracion\n- [ ] Pruebas manuales\n\n## Lista de verificacion\n- [ ] Implementacion completa\n- [ ] Pruebas agregadas\n- [ ] Documentacion actualizada" \
     --base main
   ```

8. **Crear plan de implementacion**:
   - Dividir la funcionalidad en tareas
   - Identificar dependencias
   - Anotar desafios potenciales
   - Actualizar el PR borrador con lista de tareas

## Integracion con GitHub

Este flujo de trabajo:
- Crea un issue de GitHub para seguimiento (si no se proporciona)
- Usa numero de issue en nombre de rama para vinculacion automatica
- Crea un PR en borrador temprano para visibilidad
- Vincula PR al issue con "Cierra #X"
- Establece seguimiento adecuado desde el inicio

## Preguntas a Considerar

- Con que codigo existente interactuara esta funcionalidad?
- Hay funcionalidades similares que pueda usar como referencia?
- Que pruebas seran necesarias?
- Hay consideraciones de seguridad o rendimiento?
- Como se integrara con los flujos de trabajo existentes?

Por favor analiza el codigo base y crea un plan estructurado para implementar $FEATURE_NAME.
