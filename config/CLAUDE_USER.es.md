# Scripts de Ayuda para Claude

Estos scripts de ayuda proporcionan atajos eficientes para flujos de trabajo
comunes de desarrollo. Están diseñados para ahorrar tokens y tiempo al combinar
múltiples operaciones en comandos únicos.

<ch:why-use-helpers> 🎯 **Por qué se recomiendan estos helpers:**

- Comandos únicos que reemplazan múltiples pasos manuales
- Salida estructurada optimizada para la comprensión de Claude
- Manejo automático de errores y validación
- Respuestas eficientes en tokens (menos ida y vuelta)
- Patrones consistentes entre diferentes tecnologías </ch:why-use-helpers>

<ch:aliases> ch → Helper principal: ch [categoría] [comando] chp → Vista general
del proyecto (¡muy recomendado para proyectos nuevos!) chs → Herramientas de
búsqueda: find-code, find-file, search-imports </ch:aliases>

<ch:categories> project|p → Análisis de proyecto docker|d → Ops de contenedores:
ps, logs, shell, inspect search|s → Búsqueda de código (requiere: ripgrep)
ts|node → TypeScript/Node.js (requiere: jq) python|py → Desarrollo Python (pip,
poetry, pytest) go|golang → Desarrollo Go (módulos, testing, linting) multi|m →
Ops multi-archivo (usa: bat) env|e → Verificaciones de entorno api → Pruebas API
(requiere: jq, httpie) interactive|i → Herramientas interactivas (requiere: fzf,
gum) context|ctx → Generación de contexto code-relationships|cr → Análisis de
dependencias code-quality|cq → Verificaciones de calidad mcp → Operaciones de
servidor MCP nlp|text → Análisis estático y procesamiento de texto (complejidad,
seguridad, docs) </ch:categories>

<ch:key-commands>

# 🚀 FLUJO ESENCIAL - Comienza cada proyecto con estos:
chp                          # SIEMPRE ejecutar primero - vista general completa
ch ctx for-task "desc"       # Genera contexto enfocado para tareas específicas
ch nlp tokens archivo.txt    # Verifica conteo de tokens ANTES de agregar al contexto

# 🔍 BÚSQUEDA Y DESCUBRIMIENTO (ahorro claro de tokens):
chs find-code "patrón"       # Más eficiente que grep, salida estructurada
ch s search-imports módulo   # Encuentra dónde se importan módulos
ch cr imported-by módulo     # Encuentra quién importa este módulo/archivo
ch cr dependency-tree dir    # Visualiza estructura de dependencias
ch cq console-logs           # Encuentra declaraciones de debug rápidamente
ch cq secrets-scan           # Escaneo de seguridad para secretos expuestos

# 📁 OPERACIONES DE ARCHIVOS (usar con archivos específicos):
ch m read-many a1 a2 a3      # Lee archivos ESPECÍFICOS en UNA llamada
ch m list-structure dir      # Ve qué hay en un directorio primero
ch nlp tokens arch1 arch2    # Verifica tamaños antes de lectura masiva

# 📊 ANÁLISIS DE CÓDIGO (usa comandos específicos para lo que necesitas):
ch nlp complexity archivo.py # Verifica complejidad ciclomática
ch nlp security codigo.py    # Escaneo de vulnerabilidades de seguridad
ch nlp smells codigo.py      # Detecta funciones largas, números mágicos
ch nlp docs codigo.py        # Verifica cobertura de documentación
ch nlp duplicates archivo.py 5  # Encuentra bloques de código duplicado (5+ líneas)
ch cq large-files 500        # Encuentra archivos con 500+ líneas

# 🧪 ESPECÍFICOS POR LENGUAJE (ahorradores de tokens probados):
ch py deps                   # Muestra dependencias de Python
ch py test                   # Ejecuta pruebas de Python
ch py lint                   # Ejecuta linter de Python
ch go build                  # Compila proyecto Go
ch ts check                  # Verificación de tipos TypeScript

# 🎯 GESTIÓN DE CONTEXTO (crítico para eficiencia de tokens):
ch ctx for-task "migración"  # Obtén solo contexto relevante
ch ctx summarize             # Crea resumen del proyecto
ch ctx focus src/ 2          # Enfócate en directorio específico (profundidad 2)
ch ctx mdout                 # Extrae todos los esquemas markdown

# 💡 PATRONES PARA AHORRAR TOKENS:
# 1. SIEMPRE usa chp primero para entender el proyecto
# 2. Usa ch nlp tokens para verificar tamaños antes de leer
# 3. Operaciones en lote con ch m read-many para archivos específicos
# 4. Usa comandos de análisis específicos para lo que necesitas
# 5. Verifica estructura con ch m list-structure antes de leer
# 6. Enfoca contexto con ch ctx for-task para trabajo específico

</ch:key-commands>

<ch:token-efficiency-guide>

## 🎯 MEJORES PRÁCTICAS CRÍTICAS PARA AHORRAR TOKENS

### Al Comenzar un Nuevo Proyecto:

1. **SIEMPRE ejecuta `chp` primero** - Esto da una vista completa en una sola vez
2. **Verifica tamaños con `ch nlp tokens`** antes de leer archivos grandes
3. **Usa `ch ctx for-task "descripción"`** para obtener solo contexto enfocado

### En Lugar de Múltiples Llamadas:

❌ NO: Usar Read 5 veces para 5 archivos
✅ SÍ: `ch m read-many archivo1 archivo2 archivo3 archivo4 archivo5`

❌ NO: Ejecutar grep, luego find, luego verificar imports por separado
✅ SÍ: Usar comandos específicos para lo que necesitas

❌ NO: Buscar manualmente en archivos con grep
✅ SÍ: `chs find-code "patrón"` para resultados estructurados

❌ NO: Leer archivos grandes completos sin verificar tamaño
✅ SÍ: `ch nlp tokens archivo.md` primero, luego decidir

### Descubrimiento Inteligente de Archivos:

- **Verificar primero**: `ch m list-structure dir` para ver qué hay
- **Conteo de tokens**: `ch nlp tokens arch1 arch2` antes de leer
- **Lote de archivos específicos**: `ch m read-many` cuando sabes qué necesitas
- **Dependencias**: `ch cr dependency-tree` para entender estructura

### Mejores Prácticas de Análisis:

- **Usa análisis específico**: `ch nlp complexity` en lugar de vista general
- **Verifica tamaño primero**: `ch nlp tokens` antes de cualquier análisis
- **Rastreo de imports**: `ch cr imported-by módulo` para resultados precisos

### Recuerda:

- Estos helpers devuelven datos estructurados optimizados para el parseo de Claude
- Un comando = menos tokens + respuestas más rápidas + mejor precisión
- Las herramientas interactivas (ch i) previenen selecciones incorrectas
  </ch:token-efficiency-guide>

<ch:required-tools> ripgrep → search-tools.sh jq → project-info.sh,
ts-helper.sh, api-helper.sh fzf → selecciones interactivas bat → resaltado de
sintaxis gum → prompts interactivos delta → diffs mejorados
</ch:required-tools>

<ch:paths> Scripts: ~/.claude/scripts/ Comandos: ~/.claude/commands/ </ch:paths>

<ch:user-customizations>

<!-- Específico del proyecto claude-helpers -->

Este es el proyecto claude-helpers en sí. Puntos clave:

- Entrada principal: setup.sh
- Scripts en directorio scripts/
- Comandos en directorio commands/
- Usar mejores prácticas de bash
- Mantener compatibilidad hacia atrás

## Servidores MCP

El proyecto incluye .mcp.json con:

- Playwright: Para demos de pruebas visuales
- Context7: Para búsquedas de documentación </ch:user-customizations>
