# Evaluacion de Deuda Tecnica

Por favor, ayudame a identificar y priorizar deuda tecnica en ${FOCUS_AREA:-todo el proyecto}.

Umbrales:
- Tamano de archivo: ${MAX_FILE_SIZE:-500} lineas
- Complejidad: ${MAX_COMPLEXITY:-15}
- Antiguedad de TODO: ${TODO_AGE_DAYS:-30} dias

## Descubrimiento de Deuda

1. **Encontrar TODOs y FIXMEs**:
   ```bash
   # Obtener todos los TODOs con contexto
   ch cq todos --with-context

   # Encontrar TODOs antiguos (usando git blame)
   chs find-code "TODO|FIXME|HACK|XXX" 2>/dev/null | while IFS= read -r file; do
     if [ -f "$file" ]; then
       echo "=== $file ==="
       git blame "$file" 2>/dev/null | grep -E "TODO|FIXME|HACK|XXX" || true
     fi
   done
   ```

2. **Identificar archivos grandes**:
   ```bash
   # Encontrar archivos que exceden el umbral
   ch cq large-files ${MAX_FILE_SIZE:-500}

   # Mostrar archivos mas grandes primero
   find . -name "*.${FILE_EXT:-js|ts|py}" -exec wc -l {} + | sort -rn | head -20
   ```

3. **Encontrar codigo complejo**:
   ```bash
   # Alta complejidad ciclomatica
   ch cq complexity ${MAX_COMPLEXITY:-15}

   # Codigo profundamente anidado
   chs find-code "^\\s{16,}" --files-with-matches

   # Funciones largas (multiples patrones)
   chs find-code "function.*\\{[^}]{500,}"
   ```

4. **Buscar patrones obsoletos**:
   ```bash
   # Encontrar uso deprecado
   chs find-code "@deprecated|DEPRECATED"

   # Uso de librerias antiguas
   chs find-code "${OLD_PATTERNS:-callback\\(err\\)|var\\s+\\w+\\s*=\\s*require}"
   ```

5. **Deuda de dependencias**:
   ```bash
   # Verificar paquetes desactualizados
   ch ts deps --outdated

   # Encontrar vulnerabilidades de seguridad
   ch ts audit

   # Buscar multiples versiones
   ch ts deps --duplicates
   ```

6. **Duplicacion de codigo**:
   ```bash
   # Encontrar patrones similares
   for pattern in "${DUPLICATE_PATTERNS[@]:-"function.*{" "class.*{" "interface.*{"}"; do
     echo "=== Verificando patron: $pattern ==="
     chs find-code "$pattern" --count | sort -rn | head -10
   done
   ```

7. **Pruebas faltantes**:
   ```bash
   # Encontrar archivos sin pruebas
   comm -23 \
     <(find . -name "*.${FILE_EXT:-js}" | grep -v test | sort) \
     <(chs find-file "*.test.*" | xargs grep -l "import\|require" | sort -u)
   ```

## Analisis de Deuda

Por favor analiza los hallazgos y proporciona:

1. **Matriz de Prioridad**:
   - Critico: Problemas de seguridad, funcionalidad rota
   - Alto: Problemas de rendimiento, bloqueadores de mantenibilidad
   - Medio: Calidad de codigo, patrones obsoletos
   - Bajo: Mejoras deseables

2. **Estimacion de Esfuerzo**:
   - Victorias rapidas (< 1 hora)
   - Tareas pequenas (1-4 horas)
   - Tareas medianas (1-2 dias)
   - Refactorizaciones grandes (> 2 dias)

3. **Evaluacion de Riesgo**:
   - Que podria romperse?
   - Que necesita pruebas cuidadosas?
   - Que tiene amplio impacto?

4. **Recomendaciones**:
   - Que abordar primero
   - Que puede agruparse
   - Que necesita planificacion

## Formato de Salida

Por favor organiza los hallazgos en:
```
## Informe de Deuda Tecnica

### Problemas Criticos
1. [Problema] - [Ubicacion] - [Impacto] - [Esfuerzo]

### Victorias Rapidas
1. [Problema] - [Ubicacion] - [Beneficio] - [Tiempo]

### Mejoras a Largo Plazo
1. [Area] - [Estado Actual] - [Estado Deseado] - [Plan]
```
